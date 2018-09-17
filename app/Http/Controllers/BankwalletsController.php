<?php

namespace App\Http\Controllers;

use App\Currencie;
use Illuminate\Http\Request;
use App\Bankwallet;
use App\Personne;
use Auth;
use DB;
use PDF;

class BankwalletsController extends Controller
{
    public function __construct() {
        $this->middleware('auth');

    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $currencies = Currencie::all();
        $nom_page = "Wallets Management";
        $nom_message_page = "Wallets Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('users_accounts.bankwallets.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'currencies'));

    }

    public function getListbankwallets()
    {
        $user = Auth::user();
        $bankwallets = Bankwallet::where('bankwallets.id_personne', '=', $user->id_personne)
                                    ->join('personnes', 'bankwallets.id_personne', '=', 'personnes.id')
                                    ->join('currencies', 'bankwallets.id_currencie', '=', 'currencies.id')
                                    ->select('bankwallets.id', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"), 'currencies.currencie', 'bankwallets.wallet_name', 'bankwallets.wallet_adresse')
                                    ->orderBy('currencies.currencie', 'ASC')
                                    ->get();
        return response()->json([
            'bankwallets' => $bankwallets
        ], 200);
    }

    public function ajoutOuModif_bankwallets(Request $request)
    {
        $bankwallet = new Bankwallet();
        $user = Auth::user();
        if(isset($request->id_bankwallet) && !empty($request->id_bankwallet)){
            $bankwallet = Bankwallet::find($request->id_bankwallet);
        }
        $bankwallet->id_personne = $user->id_personne;
        $bankwallet->id_currencie = $request->id_currencie;
        $bankwallet->wallet_name = $request->wallet_name;
        $bankwallet->wallet_adresse = $request->wallet_adresse;
        $result_bankwallet = $bankwallet->saveOrFail();

        if($result_bankwallet){
            $bankwallet = Bankwallet::where('bankwallets.id', '=', $bankwallet->id)
                ->join('personnes', 'bankwallets.id_personne', '=', 'personnes.id')
                ->join('currencies', 'bankwallets.id_currencie', '=', 'currencies.id')
                ->select('bankwallets.id', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"), 'currencies.currencie', 'bankwallets.wallet_name', 'bankwallets.wallet_adresse')
                ->orderBy('currencies.currencie', 'ASC')
                ->first();
            return response()->json([
                'bankwallet' => $bankwallet,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function modifier_bankwallets(Request $request)
    {
        $bankwallet = Bankwallet::find($request->id);
        if(!$bankwallet){
            return response()->json([
                'msg' => 'bankwallet Introuvable !'
            ], 200);
        }
        return response()->json([
            'bankwallet'  => $bankwallet
        ], 200);
    }

    public function supprimer_bankwallets(Request $request)
    {
        $result_bankwallet = Bankwallet::where('id','=', $request->id)->delete();
        if($result_bankwallet){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_bankwallets(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_bankwallets = Bankwallet::whereIn('id', $tab_sup)->delete();

        if($result_bankwallets){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_bankwallets()
    {
        $result_bankwallets = Bankwallet::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE bankwallets AUTO_INCREMENT=1;');

        if($result_bankwallets){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function generatePDF_bankwallets()
    {
        $user = Auth::user();
        $bankwallets = Bankwallet::where('bankwallets.id_personne', '=', $user->id_personne)
            ->join('personnes', 'bankwallets.id_personne', '=', 'personnes.id')
            ->join('currencies', 'bankwallets.id_currencie', '=', 'currencies.id')
            ->select('bankwallets.id', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"), 'currencies.currencie', 'bankwallets.wallet_name', 'bankwallets.wallet_adresse')
            ->orderBy('currencies.currencie', 'ASC')
            ->get();
        $pdf_admin_list = PDF::loadView('users_accounts.bankwallets.generatepdf', compact('bankwallets'));
        return $pdf_admin_list->download('bankwallets.pdf');
    }
}
