<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Balancebitcoin;
use App\Personne;
use App\Niveau1;
use App\Ranking;
use Auth;
use DB;
use PDF;

class BalancebitcoinsController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $rakings = Ranking::all();
        $nom_page = "Balance Bitcoin Management";
        $nom_message_page = "Balance Bitcoin Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        return view('users_accounts.balancebitcoins.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'rakings'));
    }

    public function getListbalancebitcoins(){
        $balancebitcoins = Balancebitcoin::orderBy('id', 'DESC')->get();
        $array_balancebitcoins = array();
        $rank_sponsor = 0;
        foreach($balancebitcoins as $balancebitcoin)
        {
            $sponsor = Personne::find($balancebitcoin->id_personne);
            $count_sponsor_n1 = Niveau1::where('id_parrain', '=', $balancebitcoin->id_personne)->count();
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
            $array_balancebitcoins[] = array(
                'id' => $balancebitcoin->id,
                'sponsor_nom_prenom' => $sponsor->nom . ' ' . $sponsor->prenom,
                'rank_sponsor' => $rank_sponsor,
                'balance_bitcoin' => $balancebitcoin->balance_bitcoin
            );
        }
        return response()->json([
            'balancebitcoins' => $array_balancebitcoins
        ], 200);
    }

    public function ajoutOuModif_balancebitcoins(Request $request){
        $balancebitcoin = new Balancebitcoin();
        if(isset($request->id_balance_bitcoin) && !empty($request->id_balance_bitcoin)){
            $balancebitcoin = Balancebitcoin::find($request->id_balance_bitcoin);
        }
        $balancebitcoin->balance_bitcoin = $request->balance_bitcoin;
        $result_balancebitcoin = $balancebitcoin->saveOrFail();

        if($result_balancebitcoin){
            $array_balancebitcoins = array();
            $rank_sponsor = 0;
            $sponsor = Personne::find($balancebitcoin->id_personne);
            $count_sponsor_n1 = Niveau1::where('id_parrain', '=', $balancebitcoin->id_personne)->count();
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
            $array_balancebitcoins[] = array(
                'id' => $balancebitcoin->id,
                'sponsor_nom_prenom' => $sponsor->nom . ' ' . $sponsor->prenom,
                'rank_sponsor' => $rank_sponsor,
                'balance_bitcoin' => $balancebitcoin->balance_bitcoin
            );
            return response()->json([
                'balancebitcoin' => $array_balancebitcoins,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function ajoutOuModifByRanking_balancebitcoins(Request $request){
        $array_balancebitcoins = array();
        $rank_sponsor = 0;

        $json_array_id_balancebitcoins = $request->array_id_balancebitcoins;
        $tab_array_id_balancebitcoins = explode(",", $json_array_id_balancebitcoins);

        /* var_dump($tab_array_id_balancebitcoins);
        die(); */

        foreach($tab_array_id_balancebitcoins as $tab_array_id_balancebitcoin)
        {
            $balancebitcoin = Balancebitcoin::find($tab_array_id_balancebitcoin);
            $balancebitcoin->balance_bitcoin = $balancebitcoin->balance_bitcoin + $request->balance_bitcoin;
            $result_balancebitcoin = $balancebitcoin->saveOrFail();

            if($result_balancebitcoin){
                $sponsor = Personne::find($balancebitcoin->id_personne);
                $count_sponsor_n1 = Niveau1::where('id_parrain', '=', $balancebitcoin->id_personne)->count();
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
                $array_balancebitcoins[] = array(
                    'id' => $balancebitcoin->id,
                    'sponsor_nom_prenom' => $sponsor->nom . ' ' . $sponsor->prenom,
                    'rank_sponsor' => $rank_sponsor,
                    'balance_bitcoin' => $balancebitcoin->balance_bitcoin
                );
            }else{
                return response()->json([
                    'msg' => 'Failed action  !'
                ], 200);
            }
        }
        
        return response()->json([
            'balancebitcoins' => $array_balancebitcoins,
            'msg' => 'Successful action !'
        ], 200);
    }

    public function modifier_balancebitcoins(Request $request)
    {
        $balancebitcoin = Balancebitcoin::find($request->id);
        if(!$balancebitcoin){
            return response()->json([
                'msg' => 'balancebitcoin Introuvable !'
            ], 200);
        }
        return response()->json([
            'balancebitcoin'  => $balancebitcoin
        ], 200);
    }

    public function generatePDF_balancebitcoins()
    {
        $balancebitcoins = Balancebitcoin::orderBy('id', 'DESC')->get();
        $array_balancebitcoins = array();
        foreach($balancebitcoins as $balancebitcoin)
        {
            $sponsor = Personne::find($balancebitcoin->id_personne);
            $count_sponsor_n1 = Niveau1::where('id_parrain', '=', $balancebitcoin->id_personne)->count();
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
            $array_balancebitcoins[] = array(
                'id' => $balancebitcoin->id,
                'sponsor_nom_prenom' => $sponsor->nom . ' ' . $sponsor->prenom,
                'rank_sponsor' => $rank_sponsor,
                'balance_bitcoin' => $balancebitcoin->balance_bitcoin
            );
        }
        $pdf_admin_list = PDF::loadView('users_accounts.balancebitcoins.generatepdf', compact('array_balancebitcoins'));
        return $pdf_admin_list->download('balancebitcoins.pdf');
    }
}
