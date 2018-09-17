<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use DateTime;
use DateInterval;
use App\Personne;
use App\Packabonnementplatform;
use App\Abonnementplatform;
use App\Statuscompte;
use DB;
use PDF;

class AbonnementplatformsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $statuscomptes = Statuscompte::all();
        $nom_page = "Platform Users Packs";
        $nom_message_page = "Platform Users Packs";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('subscriptions.abonnementplatforms_packs.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'statuscomptes'));
    }

    public function getabonnementplatforms_abonnementplatforms_Packs(Request $request)
    {
        $abonnementplatforms_list = Abonnementplatform::where('finished', '=', $request->finished)
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
                    'id_personne' => $personne->id,
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

    public function getabonnementplatforms_abonnementplatforms_Packs_active_id(Request $request)
    {
        $abonnementplatform_object = Abonnementplatform::where('finished', '=', 0)
            ->where('id_personne', '=', $request->id_personne)
            ->first();
        $data_abonnementplatforms = array();
        if($abonnementplatform_object)
        {
            $packabonnementplatform = Packabonnementplatform::find($abonnementplatform_object->id_packabonnementplatform);
            $personne = Personne::find($abonnementplatform_object->id_personne);

            if($abonnementplatform_object->type_payment == "Bank")
            {
                $account_payment = "Account " . $abonnementplatform_object->id_payment;
            }
            else
            {
                $account_payment = "Wallet " . $abonnementplatform_object->id_payment;
            }

            $rest = $abonnementplatform_object->total_pay - $abonnementplatform_object->paid;
            $date_now = new DateTime();
            $date_period = new DateTime($abonnementplatform_object->periode);
            $rest_periode = $date_now->diff($date_period);
            $data_abonnementplatforms[] = array(
                'id' => $abonnementplatform_object->id,
                'nom_prenom' => $personne->prenom . " " . $personne->nom,
                'packabonnementplatform' => $packabonnementplatform->nom_pack_abonnement_platform,
                'periode' => $date_period->format('d/m/Y'),
                'type_payment' => $abonnementplatform_object->type_payment,
                'id_payment' => $account_payment,
                'total_pay' => $abonnementplatform_object->total_pay,
                'paid' => $abonnementplatform_object->paid,
                'rest' => $rest,
                'rest_periode' => $rest_periode->format('%a days'),
            );
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

    public function ajoutOuModif_abonnementplatforms_packs(Request $request){
        $abonnementplatforms = new Abonnementplatform();
        if(isset($request->id_abonnementplatforms) && !empty($request->id_abonnementplatforms)){
            $abonnementplatforms = Abonnementplatform::find($request->id_abonnementplatforms);
        }
        $abonnementplatforms->paid = $request->paid;
        $result_abonnementplatforms = $abonnementplatforms->saveOrFail();

        if($result_abonnementplatforms){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function updateStatus_abonnementplatforms_packs(Request $request)
    {
        $abonnementplatforms = Abonnementplatform::find($request->id_status_abonnementplatforms);
        $abonnementplatforms->finished = $request->finished;
        $result_abonnementplatforms = $abonnementplatforms->saveOrFail();
        if($result_abonnementplatforms){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 500);
        }
    }

    public function modifier_abonnementplatforms_packs(Request $request)
    {
        $abonnementplatforms = Abonnementplatform::find($request->id);
        if(!$abonnementplatforms){
            return response()->json([
                'msg' => 'abonnementplatforms Introuvable !'
            ], 200);
        }
        return response()->json([
            'abonnementplatforms'  => $abonnementplatforms
        ], 200);
    }

    public function supprimer_abonnementplatforms_packs(Request $request)
    {
        $result_abonnementplatforms = Abonnementplatform::where('id','=', $request->id)->delete();
        if($result_abonnementplatforms){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_abonnementplatforms_packs(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_abonnementplatforms = Abonnementplatform::whereIn('id', $tab_sup)->delete();

        if($result_abonnementplatforms){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_abonnementplatforms_packs()
    {
        $result_abonnementplatforms = Abonnementplatform::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE abonnementplatformss AUTO_INCREMENT=1;');

        if($result_abonnementplatforms){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function generatePDF_abonnementplatforms_packs()
    {
        $abonnementplatforms = Abonnementplatform::all();
        $data_abonnementplatforms = array();
        $nom_prenom_array = array();
        foreach ($abonnementplatforms as $row)
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
            $nom_prenom_array[] = $personne->prenom . " " . $personne->nom;
        }
        array_multisort($nom_prenom_array, SORT_ASC, $data_abonnementplatforms);
        $pdf_admin_list = PDF::loadView('subscriptions.abonnementplatforms_packs.generatepdf', compact('data_abonnementplatforms'));
        return $pdf_admin_list->download('sponsors_subscription_packs.pdf');
    }
}
