<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Ranking;
use App\Personne;
use Auth;
use DB;
use PDF;

class RankingsController extends Controller
{
    public function __construct() {
        $this->middleware('auth');

    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Ranking Management";
        $nom_message_page = "Ranking Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('configurations.rankings.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));

    }

    public function getListrankings(){
        $rankings = Ranking::orderBy('id', 'DESC')->get();
        return response()->json([
            'rankings' => $rankings
        ], 200);
    }

    public function ajoutOuModif_rankings(Request $request){
        $ranking = new ranking();
        if(isset($request->id_ranking) && !empty($request->id_ranking)){
            $ranking = ranking::find($request->id_ranking);
        }
        $ranking->ranking = $request->ranking;
        $result_ranking = $ranking->saveOrFail();

        if($result_ranking){
            return response()->json([
                'ranking' => $ranking,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function modifier_rankings(Request $request)
    {
        $ranking = Ranking::find($request->id);
        if(!$ranking){
            return response()->json([
                'msg' => 'ranking Introuvable !'
            ], 200);
        }
        return response()->json([
            'ranking'  => $ranking
        ], 200);
    }

    public function supprimer_rankings(Request $request)
    {
        $result_ranking = Ranking::where('id','=', $request->id)->delete();
        if($result_ranking){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_rankings(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_rankings = Ranking::whereIn('id', $tab_sup)->delete();

        if($result_rankings){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_rankings()
    {
        $result_rankings = Ranking::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE rankings AUTO_INCREMENT=1;');

        if($result_rankings){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function generatePDF_rankings()
    {
        $rankings = Ranking::all();
        $pdf_admin_list = PDF::loadView('configurations.rankings.generatepdf', compact('rankings'));
        return $pdf_admin_list->download('rankings.pdf');
    }
}
