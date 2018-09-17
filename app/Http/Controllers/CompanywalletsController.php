<?php

namespace App\Http\Controllers;

use App\Currencie;
use Illuminate\Http\Request;
use App\Companywallet;
use App\Personne;
use Auth;
use DB;
use PDF;

class CompanywalletsController extends Controller
{
    public function __construct() {
        $this->middleware('auth');

    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $currencies = Currencie::all();
        $nom_page = "Company Wallets Management";
        $nom_message_page = "Company Wallets Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('configurations.companywallets.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'currencies'));

    }

    public function getListcompanywallets()
    {
        $companywallets = Companywallet::join('currencies', 'companywallets.id_currencie', '=', 'currencies.id')
            ->select('companywallets.id', 'currencies.currencie', 'companywallets.wallet_name', 'companywallets.wallet_adresse')
            ->orderBy('currencies.currencie', 'ASC')
            ->get();
        return response()->json([
            'companywallets' => $companywallets
        ], 200);
    }

    public function ajoutOuModif_companywallets(Request $request)
    {
        $companywallet = new Companywallet();
        if(isset($request->id_companywallet) && !empty($request->id_companywallet)){
            $companywallet = Companywallet::find($request->id_companywallet);
        }
        $companywallet->id_currencie = $request->id_currencie;
        $companywallet->wallet_name = $request->wallet_name;
        $companywallet->wallet_adresse = $request->wallet_adresse;
        $result_companywallet = $companywallet->saveOrFail();

        if($result_companywallet){
            $companywallet_bank = Companywallet::where('companywallets.id', '=', $companywallet->id)
                ->join('currencies', 'companywallets.id_currencie', '=', 'currencies.id')
                ->select('companywallets.id', 'currencies.currencie', 'companywallets.wallet_name', 'companywallets.wallet_adresse')
                ->first();
            return response()->json([
                'companywallet' => $companywallet_bank,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function modifier_companywallets(Request $request)
    {
        $companywallet = Companywallet::find($request->id);
        if(!$companywallet){
            return response()->json([
                'msg' => 'companywallet Introuvable !'
            ], 200);
        }
        return response()->json([
            'companywallet'  => $companywallet
        ], 200);
    }

    public function showCompanywallet(Request $request)
    {
        $companywallet = Companywallet::where('companywallets.id', '=', $request->id)
            ->join('currencies', 'companywallets.id_currencie', '=', 'currencies.id')
            ->select('companywallets.id', 'currencies.currencie', 'companywallets.wallet_name', 'companywallets.wallet_adresse')
            ->orderBy('currencies.currencie', 'ASC')
            ->first();
        return response()->json([
            'companywallet' => $companywallet
        ], 200);
    }

    public function supprimer_companywallets(Request $request)
    {
        $result_companywallet = Companywallet::where('id','=', $request->id)->delete();
        if($result_companywallet){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_companywallets(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_companywallets = Companywallet::whereIn('id', $tab_sup)->delete();

        if($result_companywallets){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_companywallets()
    {
        $result_companywallets = Companywallet::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE companywallets AUTO_INCREMENT=1;');

        if($result_companywallets){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function generatePDF_companywallets()
    {
        $companywallets = Companywallet::join('currencies', 'companywallets.id_currencie', '=', 'currencies.id')
            ->select('companywallets.id', 'currencies.currencie', 'companywallets.wallet_name', 'companywallets.wallet_adresse')
            ->orderBy('currencies.currencie', 'ASC')
            ->get();
        $pdf_admin_list = PDF::loadView('configurations.companywallets.generatepdf', compact('companywallets'));
        return $pdf_admin_list->download('companywallets.pdf');
    }
}
