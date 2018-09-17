<?php

namespace App\Http\Controllers;

use App\Bank;
use Illuminate\Http\Request;
use App\Bankaccount;
use App\Personne;
use Auth;
use DB;
use PDF;

class AdminbankaccountsController extends Controller
{
    public function __construct() {
        $this->middleware('auth');

    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $banks = Bank::all();
        $nom_page = "Admin Accounts Management";
        $nom_message_page = "Admin Accounts Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('admin_users_accounts.bankaccounts.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'banks'));

    }

    public function getAdminusersaccountslist()
    {
        $personnes = Bankaccount::join('personnes', 'bankaccounts.id_personne', '=', 'personnes.id')
            ->select('personnes.id', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"))
            ->distinct()->get();
        return response()->json([
            'personnes' => $personnes
        ], 200);
    }

    public function getListadmin_bankaccounts(Request $request)
    {
        $bankaccounts = Bankaccount::where('bankaccounts.id_personne', '=', $request->id_personne)
                                    ->join('personnes', 'bankaccounts.id_personne', '=', 'personnes.id')
                                    ->join('banks', 'bankaccounts.id_bank', '=', 'banks.id')
                                    ->select('bankaccounts.id', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"), 'banks.bank', 'bankaccounts.bank_account_number', 'bankaccounts.bank_account_country')
                                    ->orderBy('banks.bank', 'ASC')
                                    ->get();
        return response()->json([
            'bankaccounts' => $bankaccounts
        ], 200);
    }

    public function generatePDF_admin_bankaccounts(Request $request)
    {
        $bankaccounts = Bankaccount::where('bankaccounts.id_personne', '=', $request->id_personne)
                                    ->join('personnes', 'bankaccounts.id_personne', '=', 'personnes.id')
                                    ->join('banks', 'bankaccounts.id_bank', '=', 'banks.id')
                                    ->select('bankaccounts.id', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"), 'banks.bank', 'bankaccounts.bank_account_number', 'bankaccounts.bank_account_country')
                                    ->orderBy('banks.bank', 'ASC')
                                    ->get();
        $pdf_admin_list = PDF::loadView('admin_users_accounts.bankaccounts.generatepdf', compact('bankaccounts'));
        return $pdf_admin_list->download('bankaccounts.pdf');
    }
}
