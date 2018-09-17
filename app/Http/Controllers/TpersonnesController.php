<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Tpersonne;
use App\Personne;
use Auth;
use DB;
use PDF;

class TpersonnesController extends Controller
{
    public function __construct() {
        $this->middleware('auth');

    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Users Type Management";
        $nom_message_page = "Users Type Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('configurations.tpersonnes.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));

    }

    public function getListtpersonnes(){
        $tpersonnes = Tpersonne::where("tpersonne", "<>", "Super Admin")->orderBy('id', 'DESC')->get();
        return response()->json([
            'tpersonnes' => $tpersonnes
        ], 200);
    }

    public function ajoutOuModif_tpersonnes(Request $request){
        $tpersonne = new Tpersonne();
        if(isset($request->id_tpersonne) && !empty($request->id_tpersonne)){
            $tpersonne = Tpersonne::find($request->id_tpersonne);
        }
        $tpersonne->tpersonne = $request->tpersonne;
        $result_tpersonne = $tpersonne->saveOrFail();

        if($result_tpersonne){
            return response()->json([
                'tpersonne' => $tpersonne,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function modifier_tpersonnes(Request $request)
    {
        $tpersonne = Tpersonne::find($request->id);
        if(!$tpersonne){
            return response()->json([
                'msg' => 'Tpersonne Introuvable !'
            ], 200);
        }
        return response()->json([
            'tpersonne'  => $tpersonne
        ], 200);
    }

    public function supprimer_tpersonnes(Request $request)
    {
        $result_tpersonne = Tpersonne::where('id','=', $request->id)->delete();
        if($result_tpersonne){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_tpersonnes(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_tpersonnes = Tpersonne::whereIn('id', $tab_sup)->delete();

        if($result_tpersonnes){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_tpersonnes()
    {
        $result_tpersonnes = Tpersonne::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE tpersonnes AUTO_INCREMENT=1;');

        if($result_tpersonnes){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function generatePDF_tpersonnes()
    {
        $tpersonnes = Tpersonne::all();
        $pdf_admin_list = PDF::loadView('configurations.tpersonnes.generatepdf', compact('tpersonnes'));
        return $pdf_admin_list->download('users_type.pdf');
    }
}
