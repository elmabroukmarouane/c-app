<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Question;
use App\Personne;
use Auth;
use DB;
use PDF;

class QuestionsController extends Controller
{
    public function __construct() {
        $this->middleware('auth', ['except' => [
                'getListquestions'
            ]
        ]);
    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Security Questions Management";
        $nom_message_page = "Security Questions Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('configurations.questions.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));

    }

    public function getListquestions(){
        $questions = question::orderBy('id', 'DESC')->get();
        return response()->json([
            'questions' => $questions
        ], 200);
    }

    public function ajoutOuModif_questions(Request $request){
        $question = new Question();
        if(isset($request->id_question) && !empty($request->id_question)){
            $question = Question::find($request->id_question);
        }
        $question->question = $request->question;
        $result_question = $question->saveOrFail();

        if($result_question){
            return response()->json([
                'question' => $question,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function modifier_questions(Request $request)
    {
        $question = Question::find($request->id);
        if(!$question){
            return response()->json([
                'msg' => 'question Introuvable !'
            ], 200);
        }
        return response()->json([
            'question'  => $question
        ], 200);
    }

    public function supprimer_questions(Request $request)
    {
        $result_question = Question::where('id','=', $request->id)->delete();
        if($result_question){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_questions(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_questions = Question::whereIn('id', $tab_sup)->delete();

        if($result_questions){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_questions()
    {
        $result_questions = Question::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE questions AUTO_INCREMENT=1;');

        if($result_questions){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }
}
