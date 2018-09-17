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
use App\Abonnement;
use App\Ontrading;
use App\Balanceaffiliation;
use PDF;

class TradingController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $abonnements = Abonnement::all();
        $nom_page = "Trading Account";
        $nom_message_page = "Trading Account";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('trading.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'abonnements'));
    }

    public function getOntradingHistory(Request $request)
    {
        $ontrading_list = Ontrading::where('id_personne', '=', $request->id)
            ->where('finished', '=', 1)
            ->where('active', '=', 1)
            ->get();
        $data_ontrading_history = array();
        foreach ($ontrading_list as $row)
        {
            $abonnement = Abonnement::find($row->id_abonnement);
            $rest = $row->total_profit - $row->paid;

            if($row->type_payment == "Bank")
            {
                $account_payment = "Account " . $row->id_payment;
            }
            else
            {
                $account_payment = "Wallet " . $row->id_payment;
            }

            if($row->type_get_paid == "Bank")
            {
                $account_get_paid = "Account " . $row->id_get_paid;
            }
            else
            {
                $account_get_paid = "Wallet " . $row->id_get_paid;
            }

            /*$date_now = new DateTime();
            $date_period = new DateTime(date('Y-m-d', strtotime($row->periode)));
            $rest_periode = $date_now->diff($date_period);*/
            $date_period = new DateTime($row->periode);
            $data_ontrading_history[] = array(
                'abonnement' => $abonnement->titre,
                //'periode' => $row->periode,
                'periode' => $date_period->format('d/m/Y'),
                'type_payment' => $row->type_payment,
                'id_payment' => $account_payment,
                'type_get_paid' => $row->type_get_paid,
                'id_get_paid' => $account_get_paid,
                'total_profit' => $row->total_profit,
                'paid' => $row->paid,
                'rest' => $rest,
                //'rest_periode' => $rest_periode->format('%a days'),
            );
        }
        return response()->json([
            'data_ontrading_history' => $data_ontrading_history,
        ], 200);
    }

    public function buyTradingPack(Request $request)
    {
        $date_periode = new DateTime();
        $interval = new DateInterval('P' . $request->periode_pack . 'M');
        $date_periode->add($interval);

        $abonnement = Abonnement::find($request->id_abonnement);
        $total = $request->periode_pack * $abonnement->prix;

        $ontrading = new Ontrading();
        $ontrading->id_personne = $request->id_personne;
        $ontrading->id_abonnement = $request->id_abonnement;
        $ontrading->periode = $date_periode->format('Y-m-d');
        $ontrading->total_profit = $total;
        $ontrading->type_payment = $request->type_payment;
        $ontrading->id_payment = $request->id_payment;
        $ontrading->type_get_paid = $request->type_get_paid;
        $ontrading->id_get_paid = $request->id_get_paid;
        $ontrading->finished = 0;
        $ontrading->active = 0;

        $result_ontrading = $ontrading->saveOrFail();

        $msg_frontend = "You have bought successfully this pack ! <br /><br />";

        if($request->type_payment == "Bank")
        {
            $companyaccounts = Companyaccount::join('banks', 'companyaccounts.id_bank', '=', 'banks.id')
            ->select('banks.bank', 'companyaccounts.bank_account_number', 'companyaccounts.bank_account_country')
            ->get();
            $msg_frontend .= "To activate your pack, please pay the fees in one of these accounts. <br /><br />";
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
            $msg_frontend .= "To activate your pack, please pay the fees in one of these wallets. <br /><br />";
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
                $balanceaffiliation->balance_affiliation = $balanceaffiliation->balance_affiliation - $total;
                //$balanceaffiliation->balance_affiliation = $balanceaffiliation->balance_affiliation - $abonnement->prix;
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
                        ->subject('Confirmation Pack');
                $message->from('tradproject@gmail.com','Trad Project');
            });

        if($result_ontrading){
            return response()->json([
                'msg' => $msg_frontend
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 500);
        }
    }

    public function generatePDF_trading_active_packs()
    {
        $user = Auth::user();
        $ontrading_list = Ontrading::where('id_personne', '=', $user->id)
            ->where('finished', '=', 0)
            ->where('active', '=', 1)
            ->get();
            
        $data_ontradings = array();
        
        foreach ($ontrading_list as $row)
        {
            $abonnement = Abonnement::find($row->id_abonnement);
            $personne = Personne::find($row->id_personne);

            if($row->type_payment == "Bank")
            {
                $account_payment = "Account " . $row->id_payment;
            }
            else
            {
                $account_payment = "Wallet " . $row->id_payment;
            }

            if($row->type_get_paid == "Bank")
            {
                $account_get_paid = "Account " . $row->id_get_paid;
            }
            else
            {
                $account_get_paid = "Wallet " . $row->id_get_paid;
            }

            $rest = $row->total_profit - $row->paid;
            $date_now = new DateTime();
            $date_period = new DateTime($row->periode);
            $rest_periode = $date_now->diff($date_period);
            $data_ontradings[] = array(
                'id' => $row->id,
                'nom_prenom' => $personne->prenom . " " . $personne->nom,
                'abonnement' => $abonnement->titre,
                'periode' => $date_period->format('d/m/Y'),
                'type_payment' => $row->type_payment,
                'id_payment' => $account_payment,
                'type_get_paid' => $row->type_get_paid,
                'id_get_paid' => $account_get_paid,
                'total_profit' => $row->total_profit,
                'paid' => $row->paid,
                'rest' => $rest,
                'rest_periode' => $rest_periode->format('%a days'),
            );
        }
        $pdf_admin_list = PDF::loadView('trading.generatepdf', compact('data_ontradings'));
        return $pdf_admin_list->download('active_packs.pdf');
    }

    public function generatePDF_trading_history_packs()
    {
        $user = Auth::user();
        $ontrading_list = Ontrading::where('id_personne', '=', $user->id)
            ->where('finished', '=', 1)
            ->where('active', '=', 1)
            ->get();
            
        $data_ontradings = array();
        
        foreach ($ontrading_list as $row)
        {
            $abonnement = Abonnement::find($row->id_abonnement);
            $personne = Personne::find($row->id_personne);

            if($row->type_payment == "Bank")
            {
                $account_payment = "Account " . $row->id_payment;
            }
            else
            {
                $account_payment = "Wallet " . $row->id_payment;
            }

            if($row->type_get_paid == "Bank")
            {
                $account_get_paid = "Account " . $row->id_get_paid;
            }
            else
            {
                $account_get_paid = "Wallet " . $row->id_get_paid;
            }

            $rest = $row->total_profit - $row->paid;
            $date_now = new DateTime();
            $date_period = new DateTime($row->periode);
            $rest_periode = $date_now->diff($date_period);
            $data_ontradings[] = array(
                'id' => $row->id,
                'nom_prenom' => $personne->prenom . " " . $personne->nom,
                'abonnement' => $abonnement->titre,
                'periode' => $date_period->format('d/m/Y'),
                'type_payment' => $row->type_payment,
                'id_payment' => $account_payment,
                'type_get_paid' => $row->type_get_paid,
                'id_get_paid' => $account_get_paid,
                'total_profit' => $row->total_profit,
                'paid' => $row->paid,
                'rest' => $rest,
                'rest_periode' => $rest_periode->format('%a days'),
            );
        }
        $pdf_admin_list = PDF::loadView('trading.generatepdf', compact('data_ontradings'));
        return $pdf_admin_list->download('active_packs.pdf');
    }
}
