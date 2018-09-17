<?php

namespace App\Http\Controllers;

use App\Bank;
use Illuminate\Http\Request;
use App\Bankaccount;
use App\Personne;
use Auth;
use DB;
use PDF;

class BankaccountsController extends Controller
{
    public function __construct() {
        $this->middleware('auth');

    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $banks = Bank::all();
        $nom_page = "Accounts Management";
        $nom_message_page = "Accounts Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('users_accounts.bankaccounts.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'banks'));

    }

    public function getListbankaccounts()
    {
        $user = Auth::user();
        $bankaccounts = Bankaccount::where('id_personne', '=', $user->id_personne)
        ->orderBy('id', 'DESC')->get();
        $data_bankaccounts = array();
        foreach ($bankaccounts as $bankaccount)
        {
            $personne = Personne::find($bankaccount->id_personne);
            $bank = Bank::find($bankaccount->id_bank);
            $data_bankaccounts[] = array(
                'id' => $bankaccount->id,
                'nom_prenom' => $personne->prenom . " " . $personne->nom,
                'bank' => $bank->bank,
                'bank_account_number' =>$bankaccount->bank_account_number,
                'bank_account_country' => $bankaccount->bank_account_country
            );
        }
        return response()->json([
            'bankaccounts' => $data_bankaccounts
        ], 200);
    }

    public function ajoutOuModif_bankaccounts(Request $request)
    {
        $bankaccount = new Bankaccount();
        $user = Auth::user();
        if(isset($request->id_bankaccount) && !empty($request->id_bankaccount)){
            $bankaccount = Bankaccount::find($request->id_bankaccount);
        }
        $bankaccount->id_personne = $user->id_personne;
        $bankaccount->id_bank = $request->id_bank;
        $bankaccount->bank_account_country = $request->bank_account_country;
        $bankaccount->bank_account_number = $request->bank_account_number;
        $result_bankaccount = $bankaccount->saveOrFail();

        if($result_bankaccount){
            $data_bankaccount = array();
            $personne = Personne::find($bankaccount->id_personne);
            $bank = Bank::find($bankaccount->id_bank);
            $data_bankaccount[] = array(
                'id' => $bankaccount->id,
                'nom_prenom' => $personne->prenom . " " . $personne->nom,
                'bank' => $bank->bank,
                'bank_account_number' =>$bankaccount->bank_account_number,
                'bank_account_country' => $bankaccount->bank_account_country
            );
            return response()->json([
                'bankaccount' => $data_bankaccount,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function modifier_bankaccounts(Request $request)
    {
        $bankaccount = Bankaccount::find($request->id);
        if(!$bankaccount){
            return response()->json([
                'msg' => 'bankaccount Introuvable !'
            ], 200);
        }
        return response()->json([
            'bankaccount'  => $bankaccount
        ], 200);
    }

    public function supprimer_bankaccounts(Request $request)
    {
        $result_bankaccount = Bankaccount::where('id','=', $request->id)->delete();
        if($result_bankaccount){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_bankaccounts(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_bankaccounts = Bankaccount::whereIn('id', $tab_sup)->delete();

        if($result_bankaccounts){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_bankaccounts()
    {
        $result_bankaccounts = Bankaccount::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE bankaccounts AUTO_INCREMENT=1;');

        if($result_bankaccounts){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function generatePDF_bankaccounts()
    {
        //$bankaccounts = Bankaccount::all();
        $user = Auth::user();
        $bankaccounts = Bankaccount::where('id_personne', '=', $user->id_personne)
            ->orderBy('id', 'DESC')->get();
        $data_bankaccounts = array();
        $bank_array = array();
        foreach ($bankaccounts as $bankaccount)
        {
            $personne = Personne::find($bankaccount->id_personne);
            $bank = Bank::find($bankaccount->id_bank);
            $data_bankaccounts[] = array(
                'id' => $bankaccount->id,
                'nom_prenom' => $personne->prenom . " " . $personne->nom,
                'bank' => $bank->bank,
                'bank_account_number' =>$bankaccount->bank_account_number,
                'bank_account_country' => $bankaccount->bank_account_country
            );
            $bank_array[] = $bank->bank;
        }
        array_multisort($bank_array, SORT_ASC, $data_bankaccounts);
        $pdf_admin_list = PDF::loadView('users_accounts.bankaccounts.generatepdf', compact('data_bankaccounts'));
        return $pdf_admin_list->download('bankaccounts.pdf');
    }
}
