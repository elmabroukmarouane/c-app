<?php

namespace App\Http\Controllers;

use App\Statuscompte;
use App\Tpersonne;
use App\User;
use Illuminate\Http\Request;
use Auth;
use DB;
use File;
use PDF;
use App\Personne;
use App\Niveau1;
use App\Balanceaffiliation;
use App\Balanceaffiliationparameter;

class AdminsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Users Management";
        $nom_message_page = "Users Management";
        $tpersonnes = Tpersonne::all();
        $statuscomptes = Statuscompte::all();
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('users.admins', compact('tpersonnes', 'statuscomptes', 'user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));
    }
    public function admins()
    {
        $admins = User::join('personnes', 'users.id_personne', '=', 'personnes.id')
                      ->join('tpersonnes', 'personnes.id_tpersonne', '=', 'tpersonnes.id')
                      ->join('statuscomptes', 'personnes.id_statuscompte', '=', 'statuscomptes.id')
                      //->where('tpersonnes.tpersonne', '=', 'Admin')
                      ->select('personnes.id_statuscompte', 'personnes.id_tpersonne', 'personnes.id', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) AS nom_prenom"), 'personnes.date_naissance', 'personnes.telephone', 'users.email', 'personnes.image')
                      ->orderBy('personnes.nom', 'asc')
                      ->get();
        return response()->json([
            'admins'    => $admins,
        ], 200);
    }
    public function ajoutOuModif(Request $request){
        $modification =false;
        $personne = new Personne();
        $user = new User();
        if(isset($request->id_personne) && !empty($request->id_personne)){
            $modification =true;
            $personne = Personne::find($request->id_personne);
            $user = User::where('id_personne', '=', $request->id_personne)->first();
        }
        $image = $request->file('image');
        if(File::isFile($image)){
            if($modification == true)
            {
                if($personne->image != "avatar.png")
                {
                    $pathImage = public_path('/divers/images/images_admins/') . $personne->image;
                    if(file_exists($pathImage))
                    {
                        File::Delete($pathImage);
                    }
                }
            }
            $path = public_path('/divers/images/images_admins/');
            $nom_image = $request->nom . "_" . $request->prenom . "_" . str_random(8) . "." . $image->getClientOriginalExtension();
            $image->move($path, $nom_image);
        }
        else
        {
            if($modification == true)
            {
                if($personne->image != "avatar.png")
                {
                    $image_tab = explode(".", $personne->image);
                    $nom_image = $request->nom . "_" . $request->prenom . "_" . str_random(8)  . "." . $image_tab[1];
                    rename(public_path('/divers/images/images_admins/') . $personne->image, public_path('/divers/images/images_admins/') . $nom_image);
                }
                else
                {
                    $nom_image = "avatar.png";
                }
            }
            else
            {
                $nom_image = "avatar.png";
            }
        }
        $personne->id_tpersonne = $request->id_tpersonne;
        $personne->id_statuscompte = $request->id_statuscompte;
        $personne->nom = $request->nom;
        $personne->prenom = $request->prenom;
        $personne->date_naissance = $request->date_naissance;
        $personne->telephone = $request->telephone;
        $personne->adresse = $request->adresse;
        $personne->image = $nom_image;
        $result_personne = $personne->saveOrFail();

        $user->id_personne = $personne->id;
        $user->email = $request->email;
        if(isset($request->password) && !empty($request->password) && $request->password != null)
        {
            $user->password = bcrypt($request->password);
        }
        $user->online = 0;
        $result_user = $user->saveOrFail();

        $balanceaffiliation = new Balanceaffiliation();
        $balanceaffiliation->id_personne = $personne->id;
        $result_balanceaffiliation = $balanceaffiliation->saveOrFail();

        $admin = User::join('personnes', 'users.id_personne', '=', 'personnes.id')
                      ->where('users.id_personne', '=', $personne->id)
                      ->select('personnes.id', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) AS nom_prenom"), 'personnes.date_naissance', 'personnes.telephone', 'users.email', 'personnes.image')
                      ->first();

        if($result_personne && $result_user && $result_balanceaffiliation){
            return response()->json([
                "personne" => $admin,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 500);
        }
    }

    public function updateStatus(Request $request)
    {
        if($request->id_status_statuscompte == 1)
        {
            $user = User::where('id_personne', '=', $request->id_status_personne)->first();
            if($user->firstime == 1)
            {
                $result_parraine = Niveau1::where('id_parraine', '=', $request->id_status_personne)->first();
                $balanceaffiliationparameter = Balanceaffiliationparameter::find(1);
                if($result_parraine)
                {
                    $balanceaffiliation_parrain = Balanceaffiliation::where('id_personne', '=', $result_parraine->id_parrain)->first();
                    $balanceaffiliation_parrain->balance_affiliation = $balanceaffiliationparameter->affiliate_parameter;
                    $result_balanceaffiliation_parrain = $balanceaffiliation_parrain->saveOrFail();
                    if(!$result_balanceaffiliation_parrain){
                        return response()->json([
                            'msg' => 'Push Balance for Affiliate Failed !'
                        ], 500);
                    }
                }
                $balanceaffiliation_parraine = Balanceaffiliation::where('id_personne', '=', $request->id_status_personne)->first();
                $balanceaffiliation_parraine->balance_affiliation = $balanceaffiliationparameter->newcomer_parameter;
                $result_balanceaffiliation_parraine = $balanceaffiliation_parraine->saveOrFail();
                $user->firstime = 0;
                $result_user = $user->saveOrFail();
                if(!$result_balanceaffiliation_parraine || ! $result_user){
                    return response()->json([
                        'msg' => 'Push Balance for sponsor and user Failed !'
                    ], 500);
                }
            }
        }

        $personne = Personne::find($request->id_status_personne);
        $personne->id_statuscompte = $request->id_status_statuscompte;
        $result_personne = $personne->saveOrFail();
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

    public function modifier(Request $request)
    {
        $admin = User::join('personnes', 'users.id_personne', '=', 'personnes.id')
                     ->where('users.id_personne', '=', $request->id)
                     ->select('personnes.id', 'personnes.id_tpersonne', 'personnes.id_statuscompte', 'personnes.nom', 'personnes.prenom', 'personnes.date_naissance', 'personnes.telephone', 'personnes.adresse', 'users.email', 'personnes.image')
                     ->first();

        if(!$admin){
            return response()->json([
                'msg' => 'Admin Introuvable !'
            ], 404);
        }
        return response()->json([
            'personne'  => $admin
        ], 200);
    }

    public function supprimer(Request $request)
    {
        $personne = Personne::find($request->id);
        if($personne->image != "avatar.png")
        {
            $pathImage = public_path('/divers/images/images_admins/') . $personne->image;
            if(file_exists($pathImage))
            {
                File::Delete($pathImage);
            }
        }
        $result_personne = Personne::where('id','=', $request->id)->delete();
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

    public function supprimer_all(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);
        $tab_personne = array();

        foreach ($tab_sup as $id) {
            $personne = Personne::find($id);
            if($personne->image != "avatar.png")
            {
                $pathImage = public_path('/divers/images/images_admins/') . $personne->image;
                if(file_exists($pathImage))
                {
                    File::Delete($pathImage);
                }
            }
            $tab_personne[] = $id;
        }

        $result_personne = Personne::whereIn('id', $tab_personne)->delete();

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

    public function clear_table()
    {
        $result = Personne::whereNotNull('id')->delete();

        DB::statement('ALTER TABLE personnes AUTO_INCREMENT=1;');
        DB::statement('ALTER TABLE users AUTO_INCREMENT=1;');

        $pathImage = public_path('/divers/images/images_admins/');
        foreach(glob($pathImage.'*.*') as $file)
        {
            if($file != public_path('/divers/images/images_admins/') . 'avatar.png')
            {
                File::delete($file);
            }
        }

        if($result){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 500);
        }
    }
    public function generatePDF()
    {
        $admins = User::join('personnes', 'users.id_personne', '=', 'personnes.id')
            ->join('tpersonnes', 'personnes.id_tpersonne', '=', 'tpersonnes.id')
            ->join('statuscomptes', 'personnes.id_statuscompte', '=', 'statuscomptes.id')
            //->where('tpersonnes.tpersonne', '=', 'Admin')
            ->select('personnes.id_statuscompte', 'personnes.id_tpersonne', 'personnes.id', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) AS nom_prenom"), 'personnes.date_naissance', 'personnes.telephone', 'users.email', 'personnes.image')
            ->orderBy('personnes.nom', 'asc')
            ->get();
        $pdf_admin_list = PDF::loadView('users.generatepdf_admins', compact('admins'));
        return $pdf_admin_list->download('users.pdf');
    }
}
