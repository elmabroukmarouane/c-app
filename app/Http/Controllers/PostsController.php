<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Posts;
use App\Personne;
use Auth;
use DB;

class PostsController extends Controller
{
    public function __construct() {
        $this->middleware('auth');

    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Posts Management";
        $nom_message_page = "Posts Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('posts.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));

    }

    public function getListposts(){
        $posts = Posts::orderBy('id', 'DESC')->get();
        return response()->json([
            'posts' => $posts
        ], 200);
    }

    public function ajoutOuModif_posts(Request $request){
        $post = new Posts();
        if(isset($request->id_post) && !empty($request->id_post)){
            $post = Posts::find($request->id_post);
        }
        $post->title = $request->title;
        $post->detail = $request->detail;
        $result_post = $post->saveOrFail();

        if($result_post){
            return response()->json([
                'post' => $post,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function modifier_posts(Request $request)
    {
        $post = Posts::find($request->id);
        if(!$post){
            return response()->json([
                'msg' => 'post Introuvable !'
            ], 200);
        }
        return response()->json([
            'post'  => $post
        ], 200);
    }

    public function supprimer_posts(Request $request)
    {
        $result_post = Posts::where('id','=', $request->id)->delete();
        if($result_post){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function supprimer_all_posts(Request $request)
    {
        $json_sup = $request->json_tab;
        $tab_sup = json_decode($json_sup, true);

        $result_posts = Posts::whereIn('id', $tab_sup)->delete();

        if($result_posts){
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function clear_table_posts()
    {
        $result_posts = Posts::whereNotNull('id')->delete();
        DB::statement('ALTER TABLE posts AUTO_INCREMENT=1;');

        if($result_posts){
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
