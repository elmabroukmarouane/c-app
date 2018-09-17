<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Auth;
use DB;
use File;
use App\Personne;
use App\Ranking;
use App\Niveau1;
use App\Message;

class ProfilController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Update Profil";
        $nom_message_page = "Update Profil";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        return view('profil.profil_page', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));
    }

    public function updateProfilPage(Request $request)
    {
        $user_auth = Auth::user();
        $user_auth_personne_id = $user_auth->id_personne;
        $user_auth_email = $user_auth->email;
        $old_password = $request->update_old_profil_password;
        $password = $request->update_profil_password;
        $personne = Personne::find($user_auth_personne_id);
        if(isset($old_password) && !empty($old_password) && $old_password != null)
        {
            if (Auth::attempt(['email' => $user_auth_email, 'password' => $old_password]))
            {
                $user = User::where('id_personne', '=', $user_auth_personne_id)->first();
                $user->password = bcrypt($password);
            } else {
                return response()->json([
                    'msg' => 'The old password that you entered does not match the one in the database !'
                ], 404);
            }
        }
        if(isset($old_password) && !empty($old_password) && $old_password != null)
        {
            $user->active_security_questions = $request->active_security_questions;
            $user->email = $request->update_profil_email;
            $result_user = $user->saveOrFail();
        } else {
            $user_auth->active_security_questions = $request->active_security_questions;
            $user_auth->email = $request->update_profil_email;
            $result_user = $user_auth->saveOrFail();
        }
        $personne->nom = $request->update_profil_nom;
        $personne->prenom = $request->update_profil_prenom;
        $personne->date_naissance = $request->update_profil_date_naissance;
        $personne->telephone = $request->update_profil_telephone;
        $personne->adresse = $request->update_profil_adresse;
        $result_personne = $personne->saveOrFail();
        $user_update = Auth::user();
        if($result_personne && $result_user){
            return response()->json([
                "personne" => $personne,
                'user' => $user_update,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                "personne" => $personne,
                'user' => $user_update,
                'msg' => 'Failed action  !'
            ], 500);
        }
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
        $personne->nom = $request->nom;
        $personne->prenom = $request->prenom;
        $personne->date_naissance = $request->date_naissance;
        $personne->telephone = $request->telephone;
        $personne->adresse = $request->adresse;
        $personne->image = $nom_image;
        $result_personne = $personne->saveOrFail();

        $user->id_personne = $personne->id;
        $user->email = $request->email;
        $user->active_security_questions = $request->active_security_questions;
        if(isset($request->password) && !empty($request->password) && $request->password != null)
        {
            $user->password = bcrypt($request->password);
        }

        $result_user = $user->saveOrFail();

        /*$admin = User::join('personnes', 'users.id_personne', '=', 'personnes.id')
            ->where('users.id_personne', '=', $personne->id)
            ->select('personnes.id', DB::raw("CONCAT(personnes.prenom, ' ', personnes.nom) AS nom_prenom"), 'personnes.date_naissance', 'users.email', 'personnes.image')
            ->first();*/

        if($result_personne && $result_user){
            return response()->json([
                "personne" => $personne,
                "user" => $user,
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
            ->select('personnes.id', 'personnes.id_tpersonne', 'personnes.id_statuscompte', 'personnes.nom', 'personnes.prenom', 'personnes.date_naissance', 'personnes.telephone', 'personnes.adresse', 'users.email', 'personnes.image', 'users.active_security_questions')
            ->first();

        if(!$admin){
            return response()->json([
                'msg' => 'User Introuvable !'
            ], 404);
        }
        return response()->json([
            'personne'  => $admin
        ], 200);
    }

    public function ranking()
    {
        $user = Auth::user();
        //$count_user = Niveau1::where('id_parrain', '=', $user->id_personne)->count();
		$count_user = 0;
		$result_niveau1 = Niveau1::where('id_parrain', '=', $user->id_personne)
		->get();
		if($result_niveau1)
		{
			foreach ($result_niveau1 as $row)
			{
				$personne_parraine = Personne::find($row->id_parraine);
				if($personne_parraine->id_statuscompte == 1)
				{
					$count_user++;
				}
			}
		}
        if($count_user >= 0 && $count_user < 4)
        {
            $ranking = Ranking::find(1);
        }
        else if ($count_user < 8)
        {
            $ranking = Ranking::find(2);
        }
        else if ($count_user < 10)
        {
            $ranking = Ranking::find(3);
        }
        else if ($count_user < 14)
        {
            $ranking = Ranking::find(4);
        }
        else
        {
            $ranking = Ranking::find(5);
        }
        return response()->json([
            'ranking'  => $ranking->ranking
        ], 200);
    }

    public function sendMessages(Request $request)
    {
        $message = new Message();
        $message->id_personne = $request->id_personne;
        $message->message = $request->message;

        $result_message = $message->saveOrFail();

        if($result_message){
            return response()->json([
                'msg' => 'Message sent successfully !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 500);
        }
    }
}
