<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Balanceaffiliationparameter;
use App\Personne;
use Auth;

class BalanceaffiliationparametersController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }
    
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Balance Affiliate Parameters Management";
        $nom_message_page = "Balance Affiliate Parameters Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        return view('configurations.balanceaffiliationparameters.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));
    }

    public function getListbalanceaffiliationparameters(){
        $balanceaffiliationparameters = Balanceaffiliationparameter::orderBy('id', 'DESC')->get();
        return response()->json([
            'balanceaffiliationparameters' => $balanceaffiliationparameters
        ], 200);
    }

    public function ajoutOuModif_balanceaffiliationparameters(Request $request){
        $balanceaffiliationparameter = new Balanceaffiliationparameter();
        if(isset($request->id_balanceaffiliationparameter) && !empty($request->id_balanceaffiliationparameter)){
            $balanceaffiliationparameter = Balanceaffiliationparameter::find($request->id_balanceaffiliationparameter);
        }
        $balanceaffiliationparameter->newcomer_parameter = $request->newcomer_parameter;
        $balanceaffiliationparameter->affiliate_parameter = $request->affiliate_parameter;

        $result_balanceaffiliationparameter = $balanceaffiliationparameter->saveOrFail();

        if($result_balanceaffiliationparameter){
            return response()->json([
                'balanceaffiliationparameter' => $balanceaffiliationparameter,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function modifier_balanceaffiliationparameters(Request $request)
    {
        $balanceaffiliationparameter = Balanceaffiliationparameter::find($request->id);
        if(!$balanceaffiliationparameter){
            return response()->json([
                'msg' => 'balanceaffiliationparameter Introuvable !'
            ], 200);
        }
        return response()->json([
            'balanceaffiliationparameter'  => $balanceaffiliationparameter
        ], 200);
    }
}
