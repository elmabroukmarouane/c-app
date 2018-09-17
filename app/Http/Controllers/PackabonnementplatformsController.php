<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Packabonnementplatform;
use App\Personne;
use Auth;

class PackabonnementplatformsController extends Controller
{
    public function __construct() {
        $this->middleware('auth');

    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Subscription packs for platform Management";
        $nom_message_page = "Subscription packs for platform Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('configurations.packabonnementplatforms.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));

    }

    public function getListpackabonnementplatforms(){
        $packabonnementplatforms = Packabonnementplatform::orderBy('id', 'DESC')->get();
        return response()->json([
            'packabonnementplatforms' => $packabonnementplatforms
        ], 200);
    }

    public function ajoutOuModif_packabonnementplatforms(Request $request){
        $Packabonnementplatform = new Packabonnementplatform();
        if(isset($request->id_packabonnementplatform) && !empty($request->id_packabonnementplatform)){
            $Packabonnementplatform = Packabonnementplatform::find($request->id_packabonnementplatform);
        }
        $Packabonnementplatform->nom_pack_abonnement_platform = $request->nom_pack_abonnement_platform;
        $Packabonnementplatform->prix_ut = $request->prix_ut;
        $result_Packabonnementplatform = $Packabonnementplatform->saveOrFail();

        if($result_Packabonnementplatform){
            return response()->json([
                'packabonnementplatform' => $Packabonnementplatform,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function modifier_packabonnementplatforms(Request $request)
    {
        $Packabonnementplatform = Packabonnementplatform::find($request->id);
        if(!$Packabonnementplatform){
            return response()->json([
                'msg' => 'Packabonnementplatform Introuvable !'
            ], 200);
        }
        return response()->json([
            'packabonnementplatform'  => $Packabonnementplatform
        ], 200);
    }
}
