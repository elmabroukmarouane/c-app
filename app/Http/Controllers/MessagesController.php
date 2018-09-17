<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Message;
use App\Personne;
use Auth;
use DB;

class MessagesController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Messages Management";
        $nom_message_page = "Messages Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('messages.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));

    }

    public function getListmessages(){
        $messages = Message::orderBy('id', 'DESC')->get();
        $array_messages = array();
        foreach ($messages as $message)
        {
            $personne = Personne::find($message->id_personne);
            $array_messages[] = array(
                'id' => $message->id,
                'sender' => $personne->prenom . " " . $personne->nom,
                'message' => $message->message,
                'read' => $message->read,
                'created_at' => $message->created_at,
                'updated_at' => $message->updated_at
            );
        }
        return response()->json([
            'messages' => $array_messages
        ], 200);
    }

    /*public function ajoutOuModif_messages(Request $request){
        $message = new Message();
        if(isset($request->id_message) && !empty($request->id_message)){
            $message = Message::find($request->id_message);
        }
        $message->title = $request->title;
        $message->detail = $request->detail;
        $result_message = $message->saveOrFail();

        if($result_message){
            return response()->json([
                'message' => $message,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }*/

    public function modifier_messages(Request $request)
    {
        $message = Message::find($request->id);
        if(!$message){
            return response()->json([
                'msg' => 'Message Introuvable !'
            ], 200);
        }
        $message->read = 1;
        $result_message = $message->saveOrFail();
        $array_message = array();
        $personne = Personne::find($message->id_personne);
        $array_message[] = array(
            'id' => $message->id,
            'sender' => $personne->prenom . " " . $personne->nom,
            'message' => $message->message,
            'read' => $message->read,
            'created_at' => $message->created_at,
            'updated_at' => $message->updated_at
        );
        if($result_message){
            return response()->json([
                'message'  => $array_message
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_messages(Request $request)
    {
        $result_message = Message::where('id','=', $request->id)->delete();
        if($result_message){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_messages(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_messages = Message::whereIn('id', $tab_sup)->delete();

        if($result_messages){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_messages()
    {
        $result_messages = Message::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE messages AUTO_INCREMENT=1;');

        if($result_messages){
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
