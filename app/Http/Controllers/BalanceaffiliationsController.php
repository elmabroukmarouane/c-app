<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Balanceaffiliation;
use App\Personne;
use App\Niveau1;
use App\Ranking;
use Auth;
use DB;
use PDF;

class BalanceaffiliationsController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $rakings = Ranking::all();
        $nom_page = "Balance Affiliate Management";
        $nom_message_page = "Balance Affiliate Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        return view('users_accounts.balanceaffiliations.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'rakings'));
    }

    public function getListbalanceaffiliations(){
        $balanceaffiliations = Balanceaffiliation::orderBy('id', 'DESC')->get();
        $array_balanceaffiliations = array();
        $rank_sponsor = 0;
        foreach($balanceaffiliations as $balanceaffiliation)
        {
            $sponsor = Personne::find($balanceaffiliation->id_personne);
            $count_sponsor_n1 = Niveau1::where('id_parrain', '=', $balanceaffiliation->id_personne)->count();
            if($count_sponsor_n1 < 4)
            {
                $rank_sponsor = 1;
            } 
            else if($count_sponsor_n1 < 8)
            {
                $rank_sponsor = 2;
            } 
            else if($count_sponsor_n1 < 10)
            {
                $rank_sponsor = 3;
            } 
            else if($count_sponsor_n1 < 14)
            {
                $rank_sponsor = 4;
            } 
            else  if($count_sponsor_n1 >= 14)
            {
                $rank_sponsor = 5;
            }
            $array_balanceaffiliations[] = array(
                'id' => $balanceaffiliation->id,
                'sponsor_nom_prenom' => $sponsor->nom . ' ' . $sponsor->prenom,
                'rank_sponsor' => $rank_sponsor,
                'balance_affiliation' => $balanceaffiliation->balance_affiliation
            );
        }
        return response()->json([
            'balanceaffiliations' => $array_balanceaffiliations
        ], 200);
    }

    public function ajoutOuModif_balanceaffiliations(Request $request){
        $balanceaffiliation = new Balanceaffiliation();
        if(isset($request->id_balance_affiliation) && !empty($request->id_balance_affiliation)){
            $balanceaffiliation = Balanceaffiliation::find($request->id_balance_affiliation);
        }
        $balanceaffiliation->balance_affiliation = $request->balance_affiliation;
        $result_balanceaffiliation = $balanceaffiliation->saveOrFail();

        if($result_balanceaffiliation){
            $array_balanceaffiliations = array();
            $rank_sponsor = 0;
            $sponsor = Personne::find($balanceaffiliation->id_personne);
            $count_sponsor_n1 = Niveau1::where('id_parrain', '=', $balanceaffiliation->id_personne)->count();
            if($count_sponsor_n1 < 4)
            {
                $rank_sponsor = 1;
            } 
            else if($count_sponsor_n1 < 8)
            {
                $rank_sponsor = 2;
            } 
            else if($count_sponsor_n1 < 10)
            {
                $rank_sponsor = 3;
            } 
            else if($count_sponsor_n1 < 14)
            {
                $rank_sponsor = 4;
            } 
            else  if($count_sponsor_n1 >= 14)
            {
                $rank_sponsor = 5;
            }
            $array_balanceaffiliations[] = array(
                'id' => $balanceaffiliation->id,
                'sponsor_nom_prenom' => $sponsor->nom . ' ' . $sponsor->prenom,
                'rank_sponsor' => $rank_sponsor,
                'balance_affiliation' => $balanceaffiliation->balance_affiliation
            );
            return response()->json([
                'balanceaffiliation' => $array_balanceaffiliations,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function ajoutOuModifByRanking_balanceaffiliations(Request $request){
        $array_balanceaffiliations = array();
        $rank_sponsor = 0;

        $json_array_id_balanceaffiliations = $request->array_id_balanceaffiliations;
        $tab_array_id_balanceaffiliations = explode(",", $json_array_id_balanceaffiliations);

        /* var_dump($tab_array_id_balanceaffiliations);
        die(); */

        foreach($tab_array_id_balanceaffiliations as $tab_array_id_balanceaffiliation)
        {
            $balanceaffiliation = Balanceaffiliation::find($tab_array_id_balanceaffiliation);
            $balanceaffiliation->balance_affiliation = $balanceaffiliation->balance_affiliation + $request->balance_affiliation;
            $result_balanceaffiliation = $balanceaffiliation->saveOrFail();

            if($result_balanceaffiliation){
                $sponsor = Personne::find($balanceaffiliation->id_personne);
                $count_sponsor_n1 = Niveau1::where('id_parrain', '=', $balanceaffiliation->id_personne)->count();
                if($count_sponsor_n1 < 4)
                {
                    $rank_sponsor = 1;
                } 
                else if($count_sponsor_n1 < 8)
                {
                    $rank_sponsor = 2;
                } 
                else if($count_sponsor_n1 < 10)
                {
                    $rank_sponsor = 3;
                } 
                else if($count_sponsor_n1 < 14)
                {
                    $rank_sponsor = 4;
                } 
                else  if($count_sponsor_n1 >= 14)
                {
                    $rank_sponsor = 5;
                }
                $array_balanceaffiliations[] = array(
                    'id' => $balanceaffiliation->id,
                    'sponsor_nom_prenom' => $sponsor->nom . ' ' . $sponsor->prenom,
                    'rank_sponsor' => $rank_sponsor,
                    'balance_affiliation' => $balanceaffiliation->balance_affiliation
                );
            }else{
                return response()->json([
                    'msg' => 'Failed action  !'
                ], 200);
            }
        }
        
        return response()->json([
            'balanceaffiliations' => $array_balanceaffiliations,
            'msg' => 'Successful action !'
        ], 200);
    }

    public function getBalanceAffiliationByPersonne(Request $request)
    {
        $balanceaffiliation = Balanceaffiliation::where('id_personne', '=', $request->id_personne)->first();
        if(!$balanceaffiliation){
            return response()->json([
                'msg' => 'balanceaffiliation Introuvable !'
            ], 200);
        }
        return response()->json([
            'balanceaffiliation'  => $balanceaffiliation
        ], 200);
    }

    public function modifier_balanceaffiliations(Request $request)
    {
        $balanceaffiliation = Balanceaffiliation::find($request->id);
        if(!$balanceaffiliation){
            return response()->json([
                'msg' => 'balanceaffiliation Introuvable !'
            ], 200);
        }
        return response()->json([
            'balanceaffiliation'  => $balanceaffiliation
        ], 200);
    }

    public function generatePDF_balanceaffiliations()
    {
        $balanceaffiliations = Balanceaffiliation::orderBy('id', 'DESC')->get();
        $array_balanceaffiliations = array();
        foreach($balanceaffiliations as $balanceaffiliation)
        {
            $sponsor = Personne::find($balanceaffiliation->id_personne);
            $count_sponsor_n1 = Niveau1::where('id_parrain', '=', $balanceaffiliation->id_personne)->count();
            if($count_sponsor_n1 < 4)
            {
                $rank_sponsor = Ranking::find(1);
            } 
            else if($count_sponsor_n1 < 8)
            {
                $rank_sponsor = Ranking::find(2);
            } 
            else if($count_sponsor_n1 < 10)
            {
                $rank_sponsor = Ranking::find(3);
            } 
            else if($count_sponsor_n1 < 14)
            {
                $rank_sponsor = Ranking::find(4);
            } 
            else  if($count_sponsor_n1 >= 14)
            {
                $rank_sponsor = Ranking::find(5);
            }
            $array_balanceaffiliations[] = array(
                'id' => $balanceaffiliation->id,
                'sponsor_nom_prenom' => $sponsor->nom . ' ' . $sponsor->prenom,
                'rank_sponsor' => $rank_sponsor,
                'balance_affiliation' => $balanceaffiliation->balance_affiliation
            );
        }
        $pdf_admin_list = PDF::loadView('users_accounts.balanceaffiliations.generatepdf', compact('array_balanceaffiliations'));
        return $pdf_admin_list->download('balanceaffiliations.pdf');
    }
}
