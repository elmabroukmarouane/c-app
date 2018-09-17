<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Questrep;
use App\Question;
use App\Personne;
use Auth;
use DB;
use PDF;

class QuestrepsController extends Controller
{
    public function __construct() {
        $this->middleware('auth', ['except' => [
                'getRowQuestrepLogin',
                'getQuestionsDistinctId'
            ]
        ]);

    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $questions_array = Question::all();
        $count_questrep = Questrep::where("user_id", "=", $user->id)->count();
        /* $questions_array = array();
        foreach($questions as $question)
        {
            $questrep = Questrep::where('user_id', '=', $user->id)
            ->where('question_id', '=', $question->id)
            ->first();
            if(!$questrep)
            {
                $questions_array[] = array(
                    'id' => $question->id,
                    'question' => $question->question
                );
            }
        } */
        $nom_page = "Security Questions Management";
        $nom_message_page = "Security Questions Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('users_accounts.questreps.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'currencies', 'questions_array', 'count_questrep'));

    }

    public function getQuestionsDistinct()
    {
        $user = Auth::user();
        $questions = Question::all();
        $questions_array = array();
        foreach($questions as $question)
        {
            $questrep = Questrep::where('user_id', '=', $user->id)
            ->where('question_id', '=', $question->id)
            ->first();
            if(!$questrep)
            {
                $questions_array[] = array(
                    'id' => $question->id,
                    'question' => $question->question
                );
            }
        }
        return response()->json([
            'questions' => $questions_array
        ], 200);
    }

    public function getQuestionsDistinctId(Request $request)
    {
        $questreps = Questrep::where('questreps.user_id', '=', $request->user_id)
            ->join('questions', 'questreps.question_id', '=', 'questions.id')
            ->select('questions.id', 'questions.question')
            ->orderBy('questions.question', 'ASC')
            ->get();
        return response()->json([
            'questions' => $questreps
        ], 200);
    }

    public function getListquestreps()
    {
        $user = Auth::user();
        $questreps = Questrep::where('questreps.user_id', '=', $user->id)
            ->join('questions', 'questreps.question_id', '=', 'questions.id')
            ->select('questreps.id', 'questreps.question_id', 'questions.question', 'questreps.reponse')
            ->orderBy('questions.question', 'ASC')
            ->get();
        return response()->json([
            'questreps' => $questreps
        ], 200);
    }

    public function getRowQuestrepLogin(Request $request)
    {
        $questrep = Questrep::where('questreps.user_id', '=', $request->user_id)
            ->where('questreps.question_id', '=', $request->question_id)
            ->first();
        return response()->json([
            'questrep' => $questrep
        ], 200);
    }

    public function getRowQuestrep($question_id)
    {
        $user = Auth::user();
        $questrep = Questrep::where('questreps.user_id', '=', $user->id)
            ->where('questreps.question_id', '=', $question_id)
            ->first();
        return response()->json([
            'questrep' => $questrep
        ], 200);
    }

    public function add_questreps(Request $request)
    {
        $user = Auth::user();
        for($i = 1; $i <= 3; $i++)
        {
            $questrep = new Questrep();
            $questrep->user_id = $user->id;
            $questrep->question_id = $request->input('id_question_' . $i);;
            $questrep->reponse = $request->input('reponse_' . $i);
            $result_questrep = $questrep->saveOrFail();
            if($result_questrep){
                $status = "success";
            }else{
                $status = "failed";
            }
        }
        if($status == "failed")
        {
            return response()->json([
                'msg' => 'Failed action !'
            ], 500);
        }
        else if($status == "success")
        {
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }
    }

    public function modifier_questreps(Request $request)
    {
        $questrep = Questrep::find($request->id);
        if(!$questrep){
            return response()->json([
                'msg' => 'Questrep Introuvable !'
            ], 200);
        }
        return response()->json([
            'questrep'  => $questrep
        ], 200);
    }

    public function edit_questreps(Request $request)
    {
        $questrep = Questrep::find($request->id_questrep);
        $questrep->question_id = $request->question_id;
        $questrep->reponse = $request->reponse;

        $result_questrep = $questrep->saveOrFail();

        if($result_questrep){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 500);
        }

    }

    public function supprimer_questreps(Request $request)
    {
        $result_questreps = Questrep::where('id','=', $request->id)->delete();
        if($result_questreps){
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
