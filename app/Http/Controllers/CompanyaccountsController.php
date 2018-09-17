<?php

namespace App\Http\Controllers;

use App\Bank;
use Illuminate\Http\Request;
use App\Companyaccount;
use App\Personne;
use Auth;
use DB;
use PDF;

class CompanyaccountsController extends Controller
{
    public function __construct() {
        $this->middleware('auth');

    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $banks = Bank::all();
        $nom_page = "Company Accounts Management";
        $nom_message_page = "Company Accounts Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('configurations.companyaccounts.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'banks'));

    }

    public function getListcompanyaccounts()
    {
        $companyaccounts = Companyaccount::join('banks', 'companyaccounts.id_bank', '=', 'banks.id')
            ->select('companyaccounts.id', 'banks.bank', 'companyaccounts.bank_account_number', 'companyaccounts.bank_account_country')
            ->orderBy('banks.bank', 'ASC')
            ->get();
        return response()->json([
            'companyaccounts' => $companyaccounts
        ], 200);
    }

    public function ajoutOuModif_companyaccounts(Request $request)
    {
        $companyaccount = new Companyaccount();
        if(isset($request->id_companyaccount) && !empty($request->id_companyaccount)){
            $companyaccount = Companyaccount::find($request->id_companyaccount);
        }
        $companyaccount->id_bank = $request->id_bank;
        $companyaccount->bank_account_country = $request->bank_account_country;
        $companyaccount->bank_account_number = $request->bank_account_number;
        $result_companyaccount = $companyaccount->saveOrFail();

        if($result_companyaccount){
            $companyaccount_bank = Companyaccount::where('companyaccounts.id', '=', $companyaccount->id)
                ->join('banks', 'companyaccounts.id_bank', '=', 'banks.id')
                ->select('companyaccounts.id', 'banks.bank', 'companyaccounts.bank_account_number', 'companyaccounts.bank_account_country')
                ->first();
            return response()->json([
                'companyaccount' => $companyaccount_bank,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function modifier_companyaccounts(Request $request)
    {
        $companyaccount = Companyaccount::find($request->id);
        if(!$companyaccount){
            return response()->json([
                'msg' => 'companyaccount Introuvable !'
            ], 200);
        }
        return response()->json([
            'companyaccount'  => $companyaccount
        ], 200);
    }

    public function showCompanyaccount(Request $request)
    {
        $companyaccount = Companyaccount::where('companyaccounts.id', '=', $request->id)
            ->join('banks', 'companyaccounts.id_bank', '=', 'banks.id')
            ->select('companyaccounts.id', 'banks.bank', 'companyaccounts.bank_account_number', 'companyaccounts.bank_account_country')
            ->orderBy('banks.bank', 'ASC')
            ->first();
        return response()->json([
            'companyaccount' => $companyaccount
        ], 200);
    }

    public function supprimer_companyaccounts(Request $request)
    {
        $result_companyaccount = Companyaccount::where('id','=', $request->id)->delete();
        if($result_companyaccount){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_companyaccounts(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_companyaccounts = Companyaccount::whereIn('id', $tab_sup)->delete();

        if($result_companyaccounts){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_companyaccounts()
    {
        $result_companyaccounts = Companyaccount::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE companyaccounts AUTO_INCREMENT=1;');

        if($result_companyaccounts){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function generatePDF_companyaccounts()
    {
        $companyaccounts = Companyaccount::join('banks', 'companyaccounts.id_bank', '=', 'banks.id')
                                        ->select('companyaccounts.id', 'banks.bank', 'companyaccounts.bank_account_number', 'companyaccounts.bank_account_country')
                                        ->orderBy('banks.bank', 'ASC')
                                        ->get();
        $pdf_admin_list = PDF::loadView('configurations.companyaccounts.generatepdf', compact('companyaccounts'));
        return $pdf_admin_list->download('companyaccounts.pdf');
    }
}
