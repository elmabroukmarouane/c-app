<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Currencie;
use App\Personne;
use Auth;
use DB;
use PDF;

class CurrenciesController extends Controller
{
    public function __construct() {
        $this->middleware('auth');

    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Currencies Management";
        $nom_message_page = "Currencies Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('configurations.currencies.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));

    }

    public function getListcurrencies(){
        $currencies = Currencie::orderBy('id', 'DESC')->get();
        return response()->json([
            'currencies' => $currencies
        ], 200);
    }

    public function ajoutOuModif_currencies(Request $request){
        $currencie = new Currencie();
        if(isset($request->id_currencie) && !empty($request->id_currencie)){
            $currencie = Currencie::find($request->id_currencie);
        }
        $currencie->currencie = $request->currencie;
        $result_currencie = $currencie->saveOrFail();

        if($result_currencie){
            return response()->json([
                'currencie' => $currencie,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function modifier_currencies(Request $request)
    {
        $currencie = Currencie::find($request->id);
        if(!$currencie){
            return response()->json([
                'msg' => 'currencie Introuvable !'
            ], 200);
        }
        return response()->json([
            'currencie'  => $currencie
        ], 200);
    }

    public function supprimer_currencies(Request $request)
    {
        $result_currencie = Currencie::where('id','=', $request->id)->delete();
        if($result_currencie){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_currencies(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_currencies = Currencie::whereIn('id', $tab_sup)->delete();

        if($result_currencies){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_currencies()
    {
        $result_currencies = Currencie::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE currencies AUTO_INCREMENT=1;');

        if($result_currencies){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function generatePDF_currencies()
    {
        $currencies = Currencie::all();
        $pdf_admin_list = PDF::loadView('configurations.currencies.generatepdf', compact('currencies'));
        return $pdf_admin_list->download('currencies.pdf');
    }
}
