<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use Mail;
use App\Companyaccount;
use App\Companywallet;
use DateTime;
use DateInterval;
use App\Personne;
use App\Packabonnementplatform;
use App\Abonnementplatform;
use App\Balanceaffiliation;

class SubscriptionPacksController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "My Subscription Packages";
        $nom_message_page = "My Subscription Packages";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('subscriptionpacks.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));
    }

    public function getSubscriptionPacksHistory(Request $request)
    {
        $abonnementplatforms_list = Abonnementplatform::where('finished', '=', 1)
            ->where('id_personne', '=', $request->id_personne)
            ->get();
        $data_abonnementplatforms = array();
        if($abonnementplatforms_list)
        {
            foreach ($abonnementplatforms_list as $row)
            {
                $packabonnementplatform = Packabonnementplatform::find($row->id_packabonnementplatform);
                $personne = Personne::find($row->id_personne);

                if($row->type_payment == "Bank")
                {
                    $account_payment = "Account " . $row->id_payment;
                }
                else
                {
                    $account_payment = "Wallet " . $row->id_payment;
                }

                $rest = $row->total_pay - $row->paid;
                $date_now = new DateTime();
                $date_period = new DateTime($row->periode);
                $rest_periode = $date_now->diff($date_period);
                $data_abonnementplatforms[] = array(
                    'id' => $row->id,
                    'nom_prenom' => $personne->prenom . " " . $personne->nom,
                    'packabonnementplatform' => $packabonnementplatform->nom_pack_abonnement_platform,
                    'periode' => $date_period->format('d/m/Y'),
                    'type_payment' => $row->type_payment,
                    'id_payment' => $account_payment,
                    'total_pay' => $row->total_pay,
                    'paid' => $row->paid,
                    'rest' => $rest,
                    'rest_periode' => $rest_periode->format('%a days'),
                );
            }
            return response()->json([
                'data_abonnementplatforms' => $data_abonnementplatforms,
            ], 200);
        }
        else
        {
            return response()->json([
                'data_abonnementplatforms' => $data_abonnementplatforms,
            ], 200);
        }
    }

    public function buySubscriptionPack(Request $request)
    {
        $abonnementplatform_object = Abonnementplatform::where('finished', '=', 0)
            ->where('id_personne', '=', $request->id_personne)
            ->first();

        //$packabonnementplatform = Packabonnementplatform::find($abonnementplatform_object->id_packabonnementplatform);
        $packabonnementplatform = Packabonnementplatform::find(1);

        if($abonnementplatform_object)
        {
            $date_periode = new DateTime($abonnementplatform_object->periode);
            $abonnementplatform = Abonnementplatform::find($abonnementplatform_object->id);
            $total = $abonnementplatform->total_pay + ($request->periode_pack * $packabonnementplatform->prix_ut);
        }
        else
        {
            $date_periode = new DateTime();
            $abonnementplatform = new Abonnementplatform();
            $total = $request->periode_pack * $packabonnementplatform->prix_ut;
        }

        $interval = new DateInterval('P' . $request->periode_pack . 'M');
        $date_periode->add($interval);

        $abonnementplatform->id_personne = $request->id_personne;
        $abonnementplatform->id_packabonnementplatform = $request->id_packabonnementplatform;
        $abonnementplatform->periode = $date_periode->format('Y-m-d');
        $abonnementplatform->total_pay = $total;
        $abonnementplatform->type_payment = $request->type_payment;
        $abonnementplatform->id_payment = $request->id_payment;
        $abonnementplatform->finished = 0;

        $result_abonnementplatform = $abonnementplatform->saveOrFail();

        $msg_frontend = "You have bought successfully this service ! <br /><br />";

        if($request->type_payment == "Bank")
        {
            $companyaccounts = Companyaccount::join('banks', 'companyaccounts.id_bank', '=', 'banks.id')
            ->select('banks.bank', 'companyaccounts.bank_account_number', 'companyaccounts.bank_account_country')
            ->get();
            $msg_frontend .= "To activate your account, please pay the fees in one of these accounts. <br /><br />";
            $msg_frontend .= "<table class='table' style='border: #cccccc solid 1px;'><tr><th scope='col' style='border-right: #cccccc solid 1px;'>Country</th><th scope='col' style='border-right: #cccccc solid 1px;'>Bank</th><th scope='col'>Account Number</th></tr>";
            foreach($companyaccounts as $companyaccount)
            {
                $msg_frontend .= "<tr><td style='border-top: #cccccc solid 1px; border-right: #cccccc solid 1px;'>" . $companyaccount->bank_account_country . "</td><td style='border-top: #cccccc solid 1px; border-right: #cccccc solid 1px;'>" . $companyaccount->bank . "</td><td style='border-top: #cccccc solid 1px;'>" . $companyaccount->bank_account_number . "</td></tr>";
            }
        }
        else if($request->type_payment == "Wallet") 
        {
            $companywallets = Companywallet::join('currencies', 'companywallets.id_currencie', '=', 'currencies.id')
            ->select('currencies.currencie', 'companywallets.wallet_name', 'companywallets.wallet_adresse')
            ->get();
            $msg_frontend .= "To activate your account, please pay the fees in one of these wallets. <br /><br />";
            $msg_frontend .= "<table class='table' style='border: #cccccc solid 1px;'><tr><th scope='col' style='border-right: #cccccc solid 1px;'>Currencie</th><th scope='col' style='border-right: #cccccc solid 1px;'>Wallet Name</th><th scope='col'>Wallet Address</th></tr>";
            foreach($companywallets as $companywallet)
            {
                $msg_frontend .= "<tr><td style='border-top: #cccccc solid 1px; border-right: #cccccc solid 1px;'>" . $companywallet->currencie . "</td><td style='border-top: #cccccc solid 1px; border-right: #cccccc solid 1px;'>" . $companywallet->wallet_name . "</td><td style='border-top: #cccccc solid 1px;'>" . $companywallet->wallet_adresse . "</td></tr>";
            }
        }
        else if($request->type_payment == "Balance") 
        {
            $balanceaffiliation = Balanceaffiliation::where('id_personne', '=', $request->id_personne)->first();
            if($balanceaffiliation){
                $balanceaffiliation->balance_affiliation = $balanceaffiliation->balance_affiliation - $packabonnementplatform->prix_ut;
                $result_balanceaffiliation = $balanceaffiliation->saveOrFail();
                if($result_balanceaffiliation){
                    $msg_frontend .= "The payment was made by your balance !";
                }
            }
        }

        $user = Auth::user();

        $data = array(
                'msg' => $msg_frontend,
                'name' => $user->prenom . " " . $user->nom,
                "email" => $user->email
            );

        Mail::send('emails.confirmServicePack', $data, function($message) use ($data) {
                $message->to($data['email'], $data['name'])
                        ->subject('Confirmation Service');
                $message->from('tradproject@gmail.com','Trad Project');
            });

        if($result_abonnementplatform){
            return response()->json([
                'msg' => $msg_frontend
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 500);
        }
    }
}
