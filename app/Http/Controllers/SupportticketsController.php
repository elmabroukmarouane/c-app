<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Supportticket;
use App\Supportticketmessage;
use App\Personne;
use Auth;
use DB;
use PDF;

class SupportticketsController extends Controller
{
    public function __construct() {
        $this->middleware('auth');

    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "User Support Tickets";
        $nom_message_page = "User Support Tickets";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('supporttickets.users.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));

    }

    public function supporttickets_admins()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Admin Support Tickets";
        $nom_message_page = "Admin Support Tickets";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('supporttickets.admins.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));

    }

    public function getListsupportticketsusers(){
        $user = Auth::user();
        $supporttickets = Supportticket::join('personnes', 'supporttickets.id_personne', '=', 'personnes.id')
        ->where('id_personne', '=', $user->id_personne)
        ->select('supporttickets.*', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"))
        ->orderBy('id', 'DESC')->get();
        return response()->json([
            'supporttickets' => $supporttickets
        ], 200);
    }

    public function getListsupportticketsadmins(){
        $user = Auth::user();
        $supporttickets = Supportticket::join('personnes', 'supporttickets.id_personne', '=', 'personnes.id')
            //->where('id_personne', '=', $user->id_personne)
            ->select('supporttickets.*', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"))
            ->orderBy('id', 'DESC')->get();
        return response()->json([
            'supporttickets' => $supporttickets
        ], 200);
    }

    public function ajoutOuModif_supportticketsusers(Request $request){
        $user = Auth::user();
        $supportticket = new Supportticket();
        if(isset($request->id_supportticket) && !empty($request->id_supportticket)){
            $supportticket = Supportticket::find($request->id_supportticket);
            $supportticketmessage = new Supportticketmessage();
            $supportticketmessage->id_supportticket = $supportticket->id;
            $supportticketmessage->id_sender = $user->id_personne;
            $supportticketmessage->id_receiver = 5;
            $supportticketmessage->message = $request->message;
            $result_supportticketmessage = $supportticketmessage->saveOrFail();

            if($result_supportticketmessage){
                $data_supportticket = Supportticket::where('supporttickets.id_personne', '=', $user->id_personne)
                    ->where('supporttickets.id', '=', $supportticket->id)
                    ->join('personnes', 'supporttickets.id_personne', '=', 'personnes.id')
                    ->select('supporttickets.*', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"))
                    ->orderBy('supporttickets.id', 'DESC')->first();
                return response()->json([
                    'supportticket' => $data_supportticket,
                    'msg' => 'Successful action !'
                ], 200);
            }
            else
            {
                return response()->json([
                    'msg' => 'Failed action  !'
                ], 500);
            }
        }
        $supportticket->id_personne = $user->id_personne;
        $supportticket->subject = $request->subject;
        $supportticket->status = 0;
        $result_supportticket = $supportticket->saveOrFail();

        if($result_supportticket){

            $supportticketmessage = new Supportticketmessage();
            $supportticketmessage->id_supportticket = $supportticket->id;
            $supportticketmessage->id_sender = $user->id_personne;
            $supportticketmessage->id_receiver = 5;
            $supportticketmessage->message = $request->message;
            $result_supportticketmessage = $supportticketmessage->saveOrFail();

            if($result_supportticketmessage){
                $data_supportticket = Supportticket::where('supporttickets.id_personne', '=', $user->id_personne)
                    ->where('supporttickets.id', '=', $supportticket->id)
                    ->join('personnes', 'supporttickets.id_personne', '=', 'personnes.id')
                    ->select('supporttickets.*', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"))
                    ->orderBy('supporttickets.id', 'DESC')->first();
                return response()->json([
                    'supportticket' => $data_supportticket,
                    'msg' => 'Successful action !'
                ], 200);
            }
            else
            {
                return response()->json([
                    'msg' => 'Failed action  !'
                ], 500);
            }
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 500);
        }
    }

    public function ajoutOuModif_supportticketsadmins(Request $request){
        $user = Auth::user();
        if(isset($request->id_supportticket) && !empty($request->id_supportticket))
        {
            $supportticket = Supportticket::find($request->id_supportticket);
            $supportticketmessage = new Supportticketmessage();
            $supportticketmessage->id_supportticket = $supportticket->id;
            $supportticketmessage->id_sender = $user->id_personne;
            $supportticketmessage->id_receiver = $supportticket->id_personne;
            $supportticketmessage->message = $request->message;
            $result_supportticketmessage = $supportticketmessage->saveOrFail();

            if($result_supportticketmessage){
                $data_supportticket = Supportticket::where('supporttickets.id_personne', '=', $supportticket->id_personne)
                    ->where('supporttickets.id', '=', $supportticket->id)
                    ->join('personnes', 'supporttickets.id_personne', '=', 'personnes.id')
                    ->select('supporttickets.*', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"))
                    ->orderBy('supporttickets.id', 'DESC')->first();
                return response()->json([
                    'supportticket' => $data_supportticket,
                    'msg' => 'Successful action !'
                ], 200);
            }
            else
            {
                return response()->json([
                    'msg' => 'Failed action  !'
                ], 500);
            }
        }
    }

    public function get_status_supportticket(Request $request)
    {
        $supportticket = Supportticket::where('supporttickets.id', '=', $request->id)
        ->join('personnes', 'supporttickets.id_personne', '=', 'personnes.id')
        ->select('supporttickets.*', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"))
        ->orderBy('supporttickets.id', 'DESC')->first();
        return response()->json([
            'supportticket' => $supportticket,
            'msg' => 'Successful action !'
        ], 200);
    }

    public function list_supportticketmessages(Request $request)
    {
        $supportticketmessages = Supportticketmessage::where('supportticketmessages.id_supportticket', '=', $request->id_supportticket)
            ->join('supporttickets', 'supportticketmessages.id_supportticket', '=', 'supporttickets.id')
            ->join('personnes', 'supporttickets.id_personne', '=', 'personnes.id')
            ->select('supporttickets.*', 'supportticketmessages.*', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) as nom_prenom"))
            ->orderBy('supportticketmessages.created_at', 'ASC')->get();
        if(!$supportticketmessages){
            return response()->json([
                'msg' => 'supportticketmessages Introuvable !'
            ], 200);
        }
        return response()->json([
            'supportticketmessages'  => $supportticketmessages
        ], 200);
    }

    public function updateStatus_supporttickets(Request $request)
    {
        $supportticket = Supportticket::find($request->id_status_supportticket);
        $supportticket->status = $request->status_supporttickets;
        $result_personne = $supportticket->saveOrFail();
        if($result_personne){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 500);
        }
    }

    public function supprimer_supporttickets(Request $request)
    {
        $result_supportticket = supportticket::where('id','=', $request->id)->delete();
        if($result_supportticket){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_supporttickets(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_supporttickets = supportticket::whereIn('id', $tab_sup)->delete();

        if($result_supporttickets){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_supporttickets()
    {
        $result_supporttickets = supportticket::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE supporttickets AUTO_INCREMENT=1;');

        if($result_supporttickets){
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
