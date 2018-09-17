<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use DateTime;
use DateInterval;
use App\Personne;
use App\Abonnement;
use App\Ontrading;
use DB;
use PDF;

class OntradingsController extends Controller
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
        $nom_page = "Users Packs";
        $nom_message_page = "Users Packs";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('subscriptions.activate_packs.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'abonnements'));
    }

    public function getOntrading_activate_Packs(Request $request)
    {
        $ontrading_list = Ontrading::where('finished', '=', $request->finished)
            ->where('active', '=', $request->active)
            ->get();
        $data_ontrading = array();
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
            $data_ontrading[] = array(
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
        return response()->json([
            'data_ontrading' => $data_ontrading,
        ], 200);
    }

    public function ajoutOuModif_activate_packs(Request $request){
        $ontrading = new Ontrading();
        if(isset($request->id_ontrading) && !empty($request->id_ontrading)){
            $ontrading = Ontrading::find($request->id_ontrading);
        }
        $ontrading->paid = $request->paid;
        $result_ontrading = $ontrading->saveOrFail();

        if($result_ontrading){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function updateStatus_activate_packs(Request $request)
    {
        $ontrading = Ontrading::find($request->id_status_ontrading);
        $ontrading->active = $request->active;
        $result_ontrading = $ontrading->saveOrFail();
        if($result_ontrading){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 500);
        }
    }

    public function modifier_activate_packs(Request $request)
    {
        $ontrading = Ontrading::find($request->id);
        if(!$ontrading){
            return response()->json([
                'msg' => 'ontrading Introuvable !'
            ], 200);
        }
        return response()->json([
            'ontrading'  => $ontrading
        ], 200);
    }

    public function supprimer_activate_packs(Request $request)
    {
        $result_ontrading = Ontrading::where('id','=', $request->id)->delete();
        if($result_ontrading){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_activate_packs(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_ontrading = Ontrading::whereIn('id', $tab_sup)->delete();

        if($result_ontrading){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_activate_packs()
    {
        $result_ontrading = Ontrading::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE ontradings AUTO_INCREMENT=1;');

        if($result_ontrading){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function generatePDF_ontrading_packs()
    {
        $ontradings = Ontrading::all();
        $data_ontradings = array();
        $nom_prenom_array = array();
        foreach ($ontradings as $row)
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
                'id' => $row->id_personne,
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
            $nom_prenom_array[] = $personne->prenom . " " . $personne->nom;
        }
        array_multisort($nom_prenom_array, SORT_ASC, $data_ontradings);
        $pdf_admin_list = PDF::loadView('subscriptions.activate_packs.generatepdf', compact('data_ontradings'));
        return $pdf_admin_list->download('sponsors_packs.pdf');
    }
}
