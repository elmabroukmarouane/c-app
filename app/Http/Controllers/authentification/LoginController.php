<?php

namespace App\Http\Controllers\authentification;

use App\Personne;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Contracts\Encryption\DecryptException;
use Auth;
use App\Statuscompte;
use App\Tpersonne;
use App\User;
use App\Userlog;
use App\Niveau1;
use App\Niveau2;
use App\Questrep;
use App\Balanceaffiliation;
use App\Balancebitcoin;
use App\Bankaccount;
use App\Bankwallet;
use Mail;
/*use Swift_Transport;
use Swift_Message;
use Swift_Mailer;*/

class LoginController extends Controller
{
    private $url_email = "https://atlas-c-trade.com/c-app/";
    public function __construct()
    {
        $this->middleware('guest', ['except' => ['logout', 'get_client_ip']]);
    }
    public function index()
    {
        return view('auth.login');
    }

    public function login(Request $request)
    {
        //if (!Auth::check()) {
            $email = $request->email;
            $password = $request->password;

            if (Auth::attempt(['email' => $email, 'password' => $password]))
            {
                $user = Auth::user();
                $personne = Personne::find($user->id_personne);
                $status = Statuscompte::find($personne->id_statuscompte);
                $tpersonne = Tpersonne::find($personne->id_tpersonne);

                if($tpersonne->tpersonne == "Member")
                {
                    if($status->id == 1 || $status->id == 3)
                    {
                        if($user->active_security_questions == 1)
                        {
                            $id_64 = encrypt($user->id);
                            Auth::logout();
                            return redirect()->intended(route('security-questions', ['id_64' => $id_64, 'wt_64' => encrypt($password)]));
                        }
                        else if($user->active_security_questions == 0)
                        {
                            return redirect()->intended(route('home'));
                        }
                    }
                    else
                    {
                        Auth::logout();
                        return redirect()->intended(route('login'))
                            ->withErrors([
                                $this->getFailedStatusMessage($status->status_compte)
                            ]);
                    }
                }else{
                    return redirect()->intended(route('home'));
                }
            }
            return redirect()->intended(route('login'))
                ->withErrors([
                    $this->getFailedLoginMessage()
                ]);
        //}
        //return dd(false);
    }

    public function logout()
    {
        if (Auth::check()) { 
            $user_offline = Auth::user();
            $user_offline->online = '0';
            $user_offline->save();
            /*$personne = Personne::find($user_offline->id_personne);
            $tpersonne = Tpersonne::find($personne->id_tpersonne);*/

            //if($tpersonne->tpersonne == "membre"){

                $ip_address_client = $this->get_client_ip();

                if($ip_address_client == '::1')
                {
                    $ip_address_client = "127.0.0.1";
                }

                $user_log_array = array(
                    'user_id' => $user_offline->id,
                    'activite' => 'Disconnected successfully',
                    'ip_address' => $ip_address_client,
                    'status_class' => 'danger'
                );

                Userlog::create($user_log_array);
            //}

            Auth::logout();

            return redirect()->intended(route('login'))
                ->withErrors([
                    'You have been successfully logged out!'
                ]);
        }
        else
        {
            return redirect()->intended(route('login'))
                ->withErrors([
                    'Your session has been terminated automatically!'
                ]);
        }
    }

    public function showAffiliate(Request $request)
    {
        $affiliate = $request->affiliate;
        try {
            $personne_info_decrypted = decrypt($affiliate);
        } catch (DecryptException $e) {
            die($e);
        }
        $personne_array = explode('_', $personne_info_decrypted);
        $affiliate_id = $personne_array[0];
        return view('auth.login', compact('affiliate_id'));
    }

    public function refreshCaptch()
    {
        return response()->json([
                'captcha' => captcha_img()
            ], 200);
    }

    public function ajoutOuModif(Request $request){
        $this->validate($request, [
            'captcha' => 'required|captcha'
        ]);

        $personne = new Personne();
        $user = new User();

        $personne->nom = $request->nom;
        $personne->prenom = $request->prenom;
        $personne->pays = $request->pays;
        $personne->ville = $request->ville;
        $personne->zipcode = $request->zipcode;

        $personne->id_tpersonne = 1;
        $personne->id_statuscompte = 4;

        $personne->image = "avatar.png";
        $result_personne = $personne->saveOrFail();

        if($request->signup_type_payment == "Bank")
        {
            $bankaccount = new Bankaccount();
            $bankaccount->id_personne = $personne->id;
            $bankaccount->id_bank = 1;
            $bankaccount->bank_account_number = $request->signup_wallet_public_key;
            $bankaccount->bank_account_country = "Morocco";
            $result_bankaccount = $bankaccount->saveOrFail();
        }
        else if($request->signup_type_payment == "Wallet")
        {
            $bankwallet = new Bankwallet();
            $bankwallet->id_personne = $personne->id;
            $bankwallet->id_currencie = 1;
            $bankwallet->wallet_name = $request->signup_wallet_public_key;
            $bankwallet->wallet_adresse = $request->signup_payment_name;
            $result_bankwallet = $bankwallet->saveOrFail();
        }

        $user->id_personne = $personne->id;
        $user->email = $request->email;
        $user->password = bcrypt($request->password);
        $user->online = 0;
        $result_user = $user->saveOrFail();
        $affiliate_id = $request->affiliate_id;
        if(isset($affiliate_id) && !empty($affiliate_id))
        {
            $niveau1 = new Niveau1();
            $niveau1->id_parrain = $affiliate_id;
            $niveau1->id_parraine = $personne->id;
            $parraine_n1 = Niveau1::where('id_parraine', '=', $affiliate_id)
                                  ->first();
            if($parraine_n1)
            {
                $niveau2 = new Niveau2();
                $niveau2->id_parrain_base = $parraine_n1->id_parrain;
                $niveau2->id_parrain_direct = $affiliate_id;
                $niveau2->id_parraine = $personne->id;
                $result_niveau2 = $niveau2->saveOrFail();
                if(!$result_niveau2)
                {
                    return response()->json([
                        'msg' => 'Niveau 2 Failed action  !'
                    ], 500);
                }
            }
            $result_niveau1 = $niveau1->saveOrFail();
            if(!$result_niveau1)
            {
                return response()->json([
                    'msg' => 'Niveau 1 Failed action  !'
                ], 500);
            }
        }

        $balanceaffiliation = new Balanceaffiliation();
        $balanceaffiliation->id_personne = $personne->id;
        $result_balanceaffiliation = $balanceaffiliation->saveOrFail();
		
		$balancebitcoin = new Balancebitcoin();
        $balancebitcoin->id_personne = $personne->id;
        $result_balancebitcoin = $balancebitcoin->saveOrFail();

        if($result_personne && $result_user && $result_balanceaffiliation && $result_balancebitcoin){
            $id_64 = encrypt($personne->id);
            $url = $this->url_email . "confirmCompte/" . $id_64;
            $data = array(
                'name' => $request->prenom . " " . $request->nom,
                "url" => $url,
                "email" => $request->email,
                "password" => $request->password
            );
            Mail::send('emails.confirmCompte', $data, function($message) use ($data) {
                $message->to($data['email'], $data['name'])
                        ->subject('Confirmation Account');
                $message->from('c_atlas_app@atlas-c-trade.com','C-Atlas Application');
            });
            return response()->json([
                'msg' => 'Your account has been created successfully !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 500);
        }
    }

    public function confirmCompte(Request $request)
    {
        $id_64 = decrypt($request->id_64);
        $personne = Personne::find($id_64);
        if($personne)
        {
            //$personne->id_statuscompte = 1;
            $personne->id_statuscompte = 3;
            $result_personne = $personne->saveOrFail();

            if($result_personne){
                $confirm_compte_test = md5("yes_true");
                return redirect()->route('login', ['confirm_compte_test' => $confirm_compte_test]);
            }else{
                $confirm_compte_test = md5("no_error");
                return view('auth.login', compact('confirm_compte_test'));
            }
        }
        else
        {
            $confirm_compte_test = md5("no_email");
            return view('auth.login', compact('confirm_compte_test'));
        }
    }

    public function RecoverPassword(Request $request)
    {
        $remember_token = $request->remember_token;
        $user = User::where('remember_token', 'like', $remember_token)->first();
        $email = $user->email;
        if($user)
        {
            $newPassword = str_random();
            $user->password = bcrypt($newPassword);
            $result_user = $user->saveOrFail();

            if($result_user){
                $personne = Personne::find($user->id_personne);
                $data = array('name' => $personne->prenom . " " . $personne->nom, "newPassword" => $newPassword, "email" => $email);
                Mail::send('emails.sendPassword', $data, function($message) use ($data) {
                    $message->to($data['email'], $data['name'])
                            ->subject('Recover Password');
                    $message->from('c_atlas_app@atlas-c-trade.com','C-Atlas Application');
                });
                $recover_password_test = md5("yes_true");
                return redirect()->route('login', ['recover_password_test' => $recover_password_test]);
            }else{
                $recover_password_test = md5("no_error");
                return view('auth.login', compact('recover_password_test'));
            }
        }
        else
        {
            $recover_password_test = md5("no_email");
            return view('auth.login', compact('recover_password_test'));
        }
    }

    public function checkEmailSecurity(Request $request)
    {
        $email = $request->email;
        $user = User::where('email', 'like', $email)->first();
        if($user)
        {
            if($user->active_security_questions == 1)
            {
                return response()->json([
                    'user_id' => $user->id,
                    'active_security_questions' => 1
                ], 200);
            }
            else
            {
                $this->sendEmailRecoverPassword($email);
            }
        }
        else
        {
            return response()->json([
                'msg' => 'Email not found !'
            ], 404);
        }
    }

    public function CkeckRowQuestrep(Request $request)
    {
        $count = 0;
        $json_id_questions_array = $request->id_questions_array;
        $tab_id_questions_array = explode(',', $json_id_questions_array);

        foreach($tab_id_questions_array as $id_question)
        {
            $questrep = Questrep::where('user_id', '=', $request->user_id)
                ->where('question_id', '=', $id_question)
                //->where('questreps.reponse', '=', $request->input('reponse_' . $id_question))
                ->whereRaw('LOWER(`reponse`) LIKE ? ', [trim(strtolower($request->input('reponse_' . $id_question)))])
                ->first();
            if($questrep)
            {
                $count++;
            }
        }
        if($count == count($tab_id_questions_array))
        {
            return response()->json([
                'count' => $count,
                'found' => true
            ], 200);
        }
        else
        {
            return response()->json([
                'count' => $count,
                'found' => false
            ], 404);
        }
    }

    public function sendEmailRecoverPasswordPost(Request $request)
    {
        $email = $request->email;
        $user = User::where('email', 'like', $email)->first();
        if($user)
        {
            $personne = Personne::find($user->id_personne);
            $url = $this->url_email . "RecoverPassword/" . $user->remember_token;
            $data = array('name' => $personne->prenom . " " . $personne->nom, "url" => $url, "email" => $email);
            Mail::send('emails.recoverPassword', $data, function($message) use ($data) {
                $message->to($data['email'], $data['name'])
                    ->subject('Reset Password');
                $message->from('c_atlas_app@atlas-c-trade.com','C-Atlas Application');
            });
            return response()->json([
                'msg' => 'An email has been successfully sent to your mailbox !'
            ], 200);
        }
        else
        {
            return response()->json([
                'msg' => 'Email not found !'
            ], 404);
        }
    }

    public function sendEmailRecoverPassword($email)
    {
        //$email = $request->email;
        $user = User::where('email', 'like', $email)->first();
        if($user)
        {
            $personne = Personne::find($user->id_personne);
            $url = $this->url_email . "RecoverPassword/" . $user->remember_token;
            $data = array('name' => $personne->prenom . " " . $personne->nom, "url" => $url, "email" => $email);
            Mail::send('emails.recoverPassword', $data, function($message) use ($data) {
                $message->to($data['email'], $data['name'])
                        ->subject('Reset Password');
                $message->from('c_atlas_app@atlas-c-trade.com','C-Atlas Application');
            });
            return response()->json([
                    'msg' => 'An email has been successfully sent to your mailbox !'
                ], 200);
        }
        else
        {
            return response()->json([
                'msg' => 'Email not found !'
            ], 404);
        }
    }

    protected function getFailedLoginMessage()
    {
        return 'Login Failed: Email or Password Wrong !';
    }

    protected function getFailedStatusMessage($status)
    {
        return 'Your account is <strong style="text-decoration: underline;">' . $status . '</strong>. Please contact the admin of the platform !';
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
