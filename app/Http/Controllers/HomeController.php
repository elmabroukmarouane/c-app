<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Contracts\Encryption\DecryptException;
use Auth;
use DateTime;
use DB;
use App\Userlog;
use App\Personne;
use App\Ontrading;
use App\Abonnement;
use App\Niveau1;
use App\Posts;
use App\Bank;
use App\Currencie;
use App\Balanceaffiliation;
use App\Balancebitcoin;
use App\Pvbalancepersonne;
use App\Abonnementplatform;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        $data_ontrading = $this->onTradingNearFinish($personne->id);
        $data_ontrading_active = $this->getOntradingActive($personne->id);
        $total_gain_all = 0;
        $total_paid_all = 0;
        $total_rest_all = 0;
        foreach ($data_ontrading_active as $row)
        {
            $total_gain_all += $row['total_profit'];
            $total_paid_all += $row['paid'];
            $total_rest_all += $row['rest'];
        }
        $balanceaffiliation = Balanceaffiliation::where('id_personne', '=', $user->id_personne)->first();
        $balancebitcoin = Balancebitcoin::where('id_personne', '=', $user->id_personne)->first();
        $posts = Posts::where(DB::raw('MONTH(created_at)'), '=', date('m'))
            ->orderBy('id', 'desc')
            ->skip(0)
            ->take(5)
            ->get();
        $withdrawals = Pvbalancepersonne::where('pvbalancepersonnes.status_pvbalancepersonne', '=', 0)
        ->join('personnes', 'pvbalancepersonnes.id_personne', '=', 'personnes.id')
        ->join('balanceaffiliations', 'pvbalancepersonnes.id_balance_affiliation', '=', 'balanceaffiliations.id')
        ->select('pvbalancepersonnes.id', 'personnes.nom', 'personnes.prenom', 'balanceaffiliations.balance_affiliation', 'pvbalancepersonnes.type_payment', 'pvbalancepersonnes.montant_pvbalancepersonne', 'pvbalancepersonnes.status_pvbalancepersonne', 'pvbalancepersonnes.updated_at')
        ->orderBy('id', 'DESC')->take(5)->get();
        if(($personne->id_statuscompte == 1 || $personne->id_statuscompte == 2) && $user->online == 0)
        {
            $ip_address_client = $this->get_client_ip();

            if($ip_address_client == '::1')
            {
                $ip_address_client = "127.0.0.1";
            }

            $user_log_array = array(
                'user_id' => $user->id,
                'activite' => 'Connected successfully',
                'ip_address' => $ip_address_client,
                'status_class' => 'success'
            );

            Userlog::create($user_log_array);
        }
        $user->online = 1;
        $user->save();

        $nom_page = "Home";
        $nom_message_page = "Home";
        $rest_periode_days_abonnement = $this->getAbonnementsRestDays();
        return view('home.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'data_ontrading', 'total_gain_all', 'total_paid_all', 'total_rest_all', 'posts', 'balanceaffiliation', 'balancebitcoin', 'withdrawals', 'rest_periode_days_abonnement'));
    }

    public function homes()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        $data_ontrading = $this->onTradingNearFinish($personne->id);
        $data_ontrading_active = $this->getOntradingActive($personne->id);
        $total_gain_all = 0;
        $total_paid_all = 0;
        $total_rest_all = 0;
        foreach ($data_ontrading_active as $row)
        {
            $total_gain_all += $row['total_profit'];
            $total_paid_all += $row['paid'];
            $total_rest_all += $row['rest'];
        }
        $balanceaffiliation = Balanceaffiliation::where('id_personne', '=', $user->id_personne)->first();
        $balancebitcoin = Balancebitcoin::where('id_personne', '=', $user->id_personne)->first();
        $posts = Posts::where(DB::raw('MONTH(created_at)'), '=', date('m'))
            ->orderBy('id', 'desc')
            ->skip(0)
            ->take(5)
            ->get();
        $withdrawals = Pvbalancepersonne::where('pvbalancepersonnes.status_pvbalancepersonne', '=', 0)
        ->join('personnes', 'pvbalancepersonnes.id_personne', '=', 'personnes.id')
        ->join('balanceaffiliations', 'pvbalancepersonnes.id_balance_affiliation', '=', 'balanceaffiliations.id')
        ->select('pvbalancepersonnes.id', 'personnes.nom', 'personnes.prenom', 'balanceaffiliations.balance_affiliation', 'pvbalancepersonnes.type_payment', 'pvbalancepersonnes.montant_pvbalancepersonne', 'pvbalancepersonnes.status_pvbalancepersonne', 'pvbalancepersonnes.updated_at')
        ->orderBy('id', 'DESC')->take(5)->get();
        $nom_page = "Home";
        $nom_message_page = "Home";
        $rest_periode_days_abonnement = $this->getAbonnementsRestDays();
        return view('home.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'data_ontrading', 'total_gain_all', 'total_paid_all', 'total_rest_all', 'posts', 'balanceaffiliation', 'balancebitcoin', 'withdrawals', 'rest_periode_days_abonnement'));
    }

    public function getAbonnementsRestDays()
    {
        $user = Auth::user();
        $abonnementplatform_object = Abonnementplatform::where('finished', '=', 0)
            ->where('id_personne', '=', $user->id_personne)
            ->first();
        $rest_periode_days_abonnement = "";
        if($abonnementplatform_object)
        {
            $date_now = new DateTime();
            $date_period = new DateTime($abonnementplatform_object->periode);
            $rest_periode = $date_now->diff($date_period);
            $rest_periode_days_abonnement = $rest_periode->format('%a days');
            return $rest_periode_days_abonnement;
        }
        else
        {
            return null;
        }
    }

    public function posts()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Trading Training";
        $nom_message_page = "Trading Training";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('home.posts_users', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));

    }

    public function SendMessage()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Send Message";
        $nom_message_page = "Send Message";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('home.send_message', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));
    }

    public function usercompanyaccounts()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $banks = Bank::all();
        $nom_page = "Company Accounts";
        $nom_message_page = "Company Accounts";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('home.companyaccounts.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'banks'));

    }

    public function usercompanywallets()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $currencies = Currencie::all();
        $nom_page = "Company Wallets";
        $nom_message_page = "Company Wallets";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        //$message_page = "Bienvenue sur le passé, le présent et l'avenir. Bienvenue sur vos Réalisations et vos Accomplissements. Biynoli a miyeteeen hhh :D !";
        return view('home.companywallets.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt', 'currencies'));

    }

    public function getOntradingActive($id_personne)
    {
        $ontrading_list = Ontrading::where('id_personne', '=', $id_personne)
            /*->where('finished', '=', 0)
            ->where('active', '=', 1)*/
            ->get();
        $data_ontrading = array();
        foreach ($ontrading_list as $row)
        {
            $rest = $row->total_profit - $row->paid;
            $data_ontrading[] = array(
                'total_profit' => $row->total_profit,
                'paid' => $row->paid,
                'rest' => $rest
            );
        }
        /*return response()->json([
            'data_ontrading' => $data_ontrading,
        ], 200);*/
        return $data_ontrading;
    }

    public function onTradingNearFinish($id_personne)
    {
        $ontrading_list = Ontrading::where('id_personne', '=', $id_personne)
            ->where('finished', '=', 0)
            ->where('active', '=', 1)
            ->get();
        $data_ontrading = array();
        foreach ($ontrading_list as $row)
        {
            $date_now = new DateTime();
            $date_period = new DateTime($row->periode);
            $rest_periode = $date_now->diff($date_period);
            $diff_date = $rest_periode->days;
            if($diff_date < 30)
            {
                $abonnement = Abonnement::find($row->id_abonnement);
                $rest = $row->total_profit - $row->paid;
                $data_ontrading[] = array(
                    'abonnement' => $abonnement->titre,
                    'periode' => $date_period->format('d/m/Y'),
                    'total_profit' => $row->total_profit,
                    'paid' => $row->paid,
                    'rest' => $rest,
                    'rest_periode' => $rest_periode->format('%a days'),
                );
            }
        }
        /*return response()->json([
            'data_ontrading' => $data_ontrading,
        ], 200);*/
        return $data_ontrading;
    }

    public function getTotalSponsored(Request $request)
    {
        $data_get_total_sponsored = array();
        $total_jan  = Niveau1::where('id_parrain', '=', $request->id_personne)
            ->where(DB::raw('YEAR(created_at)'), '=', $request->year)
            ->where(DB::raw('MONTH(created_at)'), '=', 1)
            ->count();
        $total_feb  = Niveau1::where('id_parrain', '=', $request->id_personne)
            ->where(DB::raw('YEAR(created_at)'), '=', $request->year)
            ->where(DB::raw('MONTH(created_at)'), '=', 2)
            ->count();
        $total_mar  = Niveau1::where('id_parrain', '=', $request->id_personne)
            ->where(DB::raw('YEAR(created_at)'), '=', $request->year)
            ->where(DB::raw('MONTH(created_at)'), '=', 3)
            ->count();
        $total_apr  = Niveau1::where('id_parrain', '=', $request->id_personne)
            ->where(DB::raw('YEAR(created_at)'), '=', $request->year)
            ->where(DB::raw('MONTH(created_at)'), '=', 4)
            ->count();
        $total_may  = Niveau1::where('id_parrain', '=', $request->id_personne)
            ->where(DB::raw('YEAR(created_at)'), '=', $request->year)
            ->where(DB::raw('MONTH(created_at)'), '=', 5)
            ->count();
        $total_jun  = Niveau1::where('id_parrain', '=', $request->id_personne)
            ->where(DB::raw('YEAR(created_at)'), '=', $request->year)
            ->where(DB::raw('MONTH(created_at)'), '=', 6)
            ->count();
        $total_jul  = Niveau1::where('id_parrain', '=', $request->id_personne)
            ->where(DB::raw('YEAR(created_at)'), '=', $request->year)
            ->where(DB::raw('MONTH(created_at)'), '=', 7)
            ->count();
        $total_aug  = Niveau1::where('id_parrain', '=', $request->id_personne)
            ->where(DB::raw('YEAR(created_at)'), '=', $request->year)
            ->where(DB::raw('MONTH(created_at)'), '=', 8)
            ->count();
        $total_sep  = Niveau1::where('id_parrain', '=', $request->id_personne)
            ->where(DB::raw('YEAR(created_at)'), '=', $request->year)
            ->where(DB::raw('MONTH(created_at)'), '=', 9)
            ->count();
        $total_oct  = Niveau1::where('id_parrain', '=', $request->id_personne)
            ->where(DB::raw('YEAR(created_at)'), '=', $request->year)
            ->where(DB::raw('MONTH(created_at)'), '=', 10)
            ->count();
        $total_nov  = Niveau1::where('id_parrain', '=', $request->id_personne)
            ->where(DB::raw('YEAR(created_at)'), '=', $request->year)
            ->where(DB::raw('MONTH(created_at)'), '=', 11)
            ->count();
        $total_dec  = Niveau1::where('id_parrain', '=', $request->id_personne)
            ->where(DB::raw('YEAR(created_at)'), '=', $request->year)
            ->where(DB::raw('MONTH(created_at)'), '=', 12)
            ->count();
        $data_get_total_sponsored['draw_chart'] = array(
            $total_jan,
            $total_feb,
            $total_mar,
            $total_apr,
            $total_may,
            $total_jun,
            $total_jul,
            $total_aug,
            $total_sep,
            $total_oct,
            $total_nov,
            $total_dec,
        );
        return response()->json([
            'data_get_total_sponsored' => $data_get_total_sponsored,
        ], 200);
    }

    public function getPostsHeader()
    {
        $posts_header = Posts::where(DB::raw('MONTH(created_at)'), '=', date('m'))
            ->orderBy('id', 'desc')
            ->skip(0)
            ->take(5)
            ->get();
        $posts_array = array();
        foreach ($posts_header as $post_header)
        {
            $date_post = new DateTime($post_header->created_at);
            $posts_array[] = array(
                'title' => $post_header->title,
                'detail' => substr($post_header->detail,0,30),
                'date_post' => $date_post->format('F d, Y \a\t H:i')
            );

        }
        return response()->json([
            'posts_array' => $posts_array,
        ], 200);
    }

    function get_client_ip() {
        $ipaddress = '';
        if (isset($_SERVER['HTTP_CLIENT_IP']))
            $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
        else if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
            $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
        else if(isset($_SERVER['HTTP_X_FORWARDED']))
            $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
        else if(isset($_SERVER['HTTP_FORWARDED_FOR']))
            $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
        else if(isset($_SERVER['HTTP_FORWARDED']))
            $ipaddress = $_SERVER['HTTP_FORWARDED'];
        else if(isset($_SERVER['REMOTE_ADDR']))
            $ipaddress = $_SERVER['REMOTE_ADDR'];
        else
            $ipaddress = 'UNKNOWN';

        return $ipaddress;
    }
}
