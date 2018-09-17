<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Statuscompte;
use App\Personne;
use Auth;
use DB;
use PDF;

class StatuscomptesController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Status Type Management";
        $nom_message_page = "Status Type Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('configurations.statuscomptes.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));

    }

    public function getListstatuscomptes(){
        $statuscomptes = Statuscompte::orderBy('id', 'DESC')->get();
        return response()->json([
            'statuscomptes' => $statuscomptes
        ], 200);
    }

    public function ajoutOuModif_statuscomptes(Request $request){
        $statuscompte = new statuscompte();
        if(isset($request->id_statuscompte) && !empty($request->id_statuscompte)){
            $statuscompte = Statuscompte::find($request->id_statuscompte);
        }
        $statuscompte->status_compte = $request->status_compte;
        $result_statuscompte = $statuscompte->saveOrFail();

        if($result_statuscompte){
            return response()->json([
                'statuscompte' => $statuscompte,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function modifier_statuscomptes(Request $request)
    {
        $statuscompte = Statuscompte::find($request->id);
        if(!$statuscompte){
            return response()->json([
                'msg' => 'statuscompte Introuvable !'
            ], 200);
        }
        return response()->json([
            'statuscompte'  => $statuscompte
        ], 200);
    }

    public function supprimer_statuscomptes(Request $request)
    {
        $result_statuscompte = Statuscompte::where('id','=', $request->id)->delete();
        if($result_statuscompte){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_statuscomptes(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_statuscomptes = Statuscompte::whereIn('id', $tab_sup)->delete();

        if($result_statuscomptes){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_statuscomptes()
    {
        $result_statuscomptes = Statuscompte::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE statuscomptes AUTO_INCREMENT=1;');

        if($result_statuscomptes){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function generatePDF_statuscomptes()
    {
        $statuscomptes = Statuscompte::all();
        $pdf_admin_list = PDF::loadView('configurations.statuscomptes.generatepdf', compact('statuscomptes'));
        return $pdf_admin_list->download('status_type.pdf');
    }
}
