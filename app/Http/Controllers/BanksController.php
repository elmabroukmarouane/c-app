<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Bank;
use App\Personne;
use Auth;
use DB;
use PDF;

class BanksController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Banks Management";
        $nom_message_page = "Banks Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        return view('configurations.banks.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));
    }

    public function getListbanks(){
        $banks = Bank::orderBy('id', 'DESC')->get();
        return response()->json([
            'banks' => $banks
        ], 200);
    }

    public function ajoutOuModif_banks(Request $request){
        $bank = new Bank();
        if(isset($request->id_bank) && !empty($request->id_bank)){
            $bank = Bank::find($request->id_bank);
        }
        $bank->bank = $request->bank;
        $result_bank = $bank->saveOrFail();

        if($result_bank){
            return response()->json([
                'bank' => $bank,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function modifier_banks(Request $request)
    {
        $bank = Bank::find($request->id);
        if(!$bank){
            return response()->json([
                'msg' => 'bank Introuvable !'
            ], 200);
        }
        return response()->json([
            'bank'  => $bank
        ], 200);
    }

    public function supprimer_banks(Request $request)
    {
        $result_bank = Bank::where('id','=', $request->id)->delete();
        if($result_bank){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_banks(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_banks = Bank::whereIn('id', $tab_sup)->delete();

        if($result_banks){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_banks()
    {
        $result_banks = Bank::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE banks AUTO_INCREMENT=1;');

        if($result_banks){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function generatePDF_banks()
    {
        $banks = Bank::all();
        $pdf_admin_list = PDF::loadView('configurations.banks.generatepdf', compact('banks'));
        return $pdf_admin_list->download('banks.pdf');
    }
}
