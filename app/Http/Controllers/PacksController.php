<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Abonnement;
use App\Personne;
use Auth;
use DB;
use PDF;

class PacksController extends Controller
{
    public function __construct() {
        $this->middleware('auth');

    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Packs Management";
        $nom_message_page = "Packs Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('subscriptions.packs.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));

    }

    public function getListpacks(){
        $abonnements = Abonnement::orderBy('id', 'DESC')->get();
        return response()->json([
            'abonnements' => $abonnements
        ], 200);
    }

    public function ajoutOuModif_packs(Request $request){
        $abonnement = new Abonnement();
        if(isset($request->id_pack) && !empty($request->id_pack)){
            $abonnement = Abonnement::find($request->id_pack);
        }
        $abonnement->titre = $request->titre;
        $abonnement->prix = $request->prix;
        $abonnement->description_1 = $request->description_1;
        $abonnement->description_2 = $request->description_2;
        $abonnement->popular = $request->popular;
        $result_abonnement = $abonnement->saveOrFail();

        if($result_abonnement){
            return response()->json([
                'pack' => $abonnement,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function modifier_packs(Request $request)
    {
        $abonnement = Abonnement::find($request->id);
        if(!$abonnement){
            return response()->json([
                'msg' => 'abonnement Introuvable !'
            ], 200);
        }
        return response()->json([
            'pack'  => $abonnement
        ], 200);
    }

    public function supprimer_abonnements(Request $request)
    {
        $result_abonnement = abonnement::where('id','=', $request->id)->delete();
        if($result_abonnement){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_abonnements(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_abonnements = abonnement::whereIn('id', $tab_sup)->delete();

        if($result_abonnements){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_abonnements()
    {
        $result_abonnements = abonnement::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE abonnements AUTO_INCREMENT=1;');

        if($result_abonnements){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function generatePDF_packs()
    {
        $abonnements = Abonnement::all();
        $pdf_admin_list = PDF::loadView('subscriptions.packs.generatepdf', compact('abonnements'));
        return $pdf_admin_list->download('packs.pdf');
    }
}
