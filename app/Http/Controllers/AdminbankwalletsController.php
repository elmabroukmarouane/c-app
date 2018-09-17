<?php

namespace App\Http\Controllers;

use App\Currencie;
use Illuminate\Http\Request;
use App\Bankwallet;
use App\Personne;
use Auth;
use DB;
use PDF;

class AdminbankwalletsController extends Controller
{
    public function __construct() {
        $this->middleware('auth');

    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $currencies = Currencie::all();
        $nom_page = "Admin Wallets Management";
        $nom_message_page = "Admin Wallets Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('admin_users_accounts.bankwallets.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'currencies'));

    }

    public function getAdminuserswalletslist()
    {
        $personnes = Bankwallet::join('personnes', 'bankwallets.id_personne', '=', 'personnes.id')
            ->select('personnes.id', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"))
            ->distinct()->get();
        return response()->json([
            'personnes' => $personnes
        ], 200);
    }

    public function getListadmin_bankwallets(Request $request)
    {
        $bankwallets = Bankwallet::where('bankwallets.id_personne', '=', $request->id_personne)
            ->join('personnes', 'bankwallets.id_personne', '=', 'personnes.id')
            ->join('currencies', 'bankwallets.id_currencie', '=', 'currencies.id')
            ->select('bankwallets.id', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"), 'currencies.currencie', 'bankwallets.wallet_name', 'bankwallets.wallet_adresse')
            ->orderBy('currencies.currencie', 'ASC')
            ->get();
        return response()->json([
            'bankwallets' => $bankwallets
        ], 200);
    }

    public function generatePDF_admin_bankwallets(Request $request)
    {
        $bankwallets = Bankwallet::where('bankwallets.id_personne', '=', $request->id_personne)
            ->join('personnes', 'bankwallets.id_personne', '=', 'personnes.id')
            ->join('currencies', 'bankwallets.id_currencie', '=', 'currencies.id')
            ->select('bankwallets.id', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"), 'currencies.currencie', 'bankwallets.wallet_name', 'bankwallets.wallet_adresse')
            ->orderBy('currencies.currencie', 'ASC')
            ->get();
        $pdf_admin_list = PDF::loadView('admin_users_accounts.bankwallets.generatepdf', compact('bankwallets'));
        return $pdf_admin_list->download('bankwallets.pdf');
    }
}
