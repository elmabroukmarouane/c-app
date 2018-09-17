<?php

namespace App\Http\Controllers;

use App\Abonnement;
use Illuminate\Http\Request;
use App\User;
use Auth;
use DateTime;
use App\Personne;
use App\Niveau1;
use App\Niveau2;
use App\Ranking;
use App\Ontrading;

class NetworksController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "My Network";
        $nom_message_page = "My Network";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        $result_graph = $this->getGraph();
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('networks.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'result_graph'));
    }

    public function getGraph()
    {
        $user = Auth::user();
        $id_personne = $user->id_personne;
        $personne = Personne::find($user->id_personne);
        $result_niveau1 = Niveau1::where('id_parrain', '=', $id_personne)
            ->get();
        $result_graph = array();
        if($result_niveau1)
        {
            $result_graph['chart'] = array(
                'container' => '#tree-simple'
            );
            $result_graph['nodeStructure']['text'] = array(
                'name' => $personne->prenom . ' ' . $personne->nom
            );
            $result_graph['nodeStructure']['HTMLclass'] = 'node-treant-box';

            foreach ($result_niveau1 as $row)
            {
                $personne_parraine = Personne::find($row->id_parraine);
                if($personne_parraine->id_statuscompte == 1)
                {
                    $result_niveau2 = Niveau2::where('id_parrain_direct', '=', $row->id_parraine)
                                            ->get();
                    if($result_niveau2)
                    {
                        $datan2 = array();
                        foreach ($result_niveau2 as $row_direct)
                        {
                            $personne_parraine_n2 = Personne::find($row_direct->id_parraine);
                            if($personne_parraine_n2->id_statuscompte == 1)
                            {
                                $datan2[] = array(
                                    'text' => array(
                                        'name' => $personne_parraine_n2->prenom . ' ' . $personne_parraine_n2->nom
                                    ),
                                    'HTMLclass' => 'node-treant-box'
                                );
                            }
                        }
                    }
                    if(count($datan2) > 0)
                    {
                        $data[] = array(
                            'text' => array(
                                'name' => $personne_parraine->prenom . ' ' . $personne_parraine->nom
                            ),
                            'HTMLclass' => 'node-treant-box',
                            'children' => $datan2
                        );
                    }
                    else
                    {
                        $data[] = array(
                            'text' => array(
                                'name' => $personne_parraine->prenom . ' ' . $personne_parraine->nom
                            ),
                            'HTMLclass' => 'node-treant-box'
                        );
                    }
                }
            }
            if(isset($data) && !empty($data) && count($data) > 0)
            {
                $result_graph['nodeStructure']['children'] = $data;
            }
            else
            {
                $result_graph['nodeStructure']['children'] = '';
            }
        }
        return $result_graph;
        /*return response()->json([
            $result_graph,
        ], 200);*/
    }

    public function getAffiliates()
    {
        $user = Auth::user();
        $id_personne = $user->id_personne;
        $result_niveau1 = Niveau1::where('id_parrain', '=', $id_personne)
            ->get();
        $datan1 = array();
        if($result_niveau1)
        {
            foreach ($result_niveau1 as $row)
            {
                $personne_parraine_n1 = Personne::find($row->id_parraine);
                $user_parraine_n1 = User::where('id_personne', '=', $row->id_parraine)
                    ->first();
                //$ontrading_parraine_n1 = Ontrading::where('id_personne', '=', $row->id_parraine)->get();
                $count_user_n1 = Niveau1::where('id_parrain', '=', $row->id_parraine)->count();
                if($count_user_n1 >= 0 && $count_user_n1 < 4)
                {
                    $ranking_n1 = Ranking::find(1);
                }
                else if ($count_user_n1 < 8)
                {
                    $ranking_n1 = Ranking::find(2);
                }
                else if ($count_user_n1 < 10)
                {
                    $ranking_n1 = Ranking::find(3);
                }
                else if ($count_user_n1 < 14)
                {
                    $ranking_n1 = Ranking::find(4);
                }
                else
                {
                    $ranking_n1 = Ranking::find(5);
                }
                $result_niveau2 = Niveau2::where('id_parrain_direct', '=', $row->id_parraine)
                    ->get();
                if($result_niveau2)
                {
                    $datan2 = array();
                    foreach ($result_niveau2 as $row_direct)
                    {
                        $personne_parraine_n2 = Personne::find($row_direct->id_parraine);
                        $user_parraine_n2 = User::where('id_personne', '=', $row_direct->id_parraine)
                            ->first();
                        //$ontrading_parraine_n2 = Ontrading::where('id_personne', '=', $row_direct->id_parraine)->get();
                        $count_user_n2 = Niveau1::where('id_parrain', '=', $row_direct->id_parraine)->count();
                        if($count_user_n2 >= 0 && $count_user_n2 < 4)
                        {
                            $ranking_n2 = Ranking::find(1);
                        }
                        else if ($count_user_n2 < 8)
                        {
                            $ranking_n2 = Ranking::find(2);
                        }
                        else if ($count_user_n2 < 10)
                        {
                            $ranking_n2 = Ranking::find(3);
                        }
                        else if ($count_user_n2 < 14)
                        {
                            $ranking_n2 = Ranking::find(4);
                        }
                        else
                        {
                            $ranking_n2 = Ranking::find(5);
                        }
                        $date_inscription_n2 = new DateTime($personne_parraine_n2->created_at);
                        $datan2[] = array(
                            'id_personne' => $row_direct->id_parraine,
                            'nom_prenom' => $personne_parraine_n2->prenom . ' ' . $personne_parraine_n2->nom,
                            'ranking' => $ranking_n2->ranking,
                            'date_inscription' => $date_inscription_n2->format('d/m/Y H:i:s'),
                            'email' => $user_parraine_n2->email,
                            'telephone' => $personne_parraine_n2->telephone,
                            //'ontrading_parraine_n2' => $ontrading_parraine_n2
                        );
                    }
                }
                $date_inscription_n1 = new DateTime($personne_parraine_n1->created_at);
                if(count($datan2) > 0)
                {
                    $datan1[] = array(
                        'id_personne' => $row->id_parraine,
                        'nom_prenom' => $personne_parraine_n1->prenom . ' ' . $personne_parraine_n1->nom,
                        'ranking' => $ranking_n1->ranking,
                        'date_inscription' => $date_inscription_n1->format('d/m/Y H:i:s'),
                        'email' => $user_parraine_n1->email,
                        'telephone' => $personne_parraine_n1->telephone,
                        'affiliates' => $datan2,
                        //'ontrading_parraine_n1' => $ontrading_parraine_n1
                    );
                }
                else
                {
                    $datan1[] = array(
                        'id_personne' => $row->id_parraine,
                        'nom_prenom' => $personne_parraine_n1->prenom . ' ' . $personne_parraine_n1->nom,
                        'ranking' => $ranking_n1->ranking,
                        'date_inscription' => $date_inscription_n1->format('d/m/Y H:i:s'),
                        'email' => $user_parraine_n1->email,
                        'telephone' => $personne_parraine_n1->telephone,
                        //'ontrading_parraine_n1' => $ontrading_parraine_n1
                    );
                }
            }
        }
        return response()->json([
            'affiliates_list' => $datan1,
        ], 200);
    }

    public function getOntrading(Request $request)
    {
        $ontrading_list = Ontrading::where('id_personne', '=', $request->id)
            ->where('finished', '=', 0)
            ->where('active', '=', 1)
            ->get();
        $data_ontrading = array();
        foreach ($ontrading_list as $row)
        {
            $abonnement = Abonnement::find($row->id_abonnement);
            $rest = $row->total_profit - $row->paid;
            $date_now = new DateTime();
            $date_period = new DateTime($row->periode);
            $rest_periode = $date_now->diff($date_period);

            if($row->type_payment == "Bank")
            {
                $account_payment = "Account " . $row->id_payment;
            }
            else
            {
                $account_payment = "Wallet " . $row->id_payment;
            }

            if($row->type_get_paid == "Bank")
            {
                $account_get_paid = "Account " . $row->id_get_paid;
            }
            else
            {
                $account_get_paid = "Wallet " . $row->id_get_paid;
            }

            $data_ontrading[] = array(
                'abonnement' => $abonnement->titre,
                //'periode' => $row->periode,
                'periode' => $date_period->format('d/m/Y'),
                'type_payment' => $row->type_payment,
                'id_payment' => $account_payment,
                'type_get_paid' => $row->type_get_paid,
                'id_get_paid' => $account_get_paid,
                'total_profit' => $row->total_profit,
                'paid' => $row->paid,
                'rest' => $rest,
                'rest_periode' => $rest_periode->format('%a days'),
            );
        }
        return response()->json([
            'data_ontrading' => $data_ontrading,
        ], 200);
    }
}
