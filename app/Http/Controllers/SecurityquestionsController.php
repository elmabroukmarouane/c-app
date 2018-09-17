<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Questrep;
use App\Userlog;
use App\Personne;
use App\User;
use App\Question;
use Auth;
use Mail;

class SecurityquestionsController extends Controller
{
    private $url_email = "https://atlas-c-trade.com/c-app/";
    public function index(Request $request)
    {
        $user_id = decrypt(app('request')->input('id_64'));
        $wt_64 = app('request')->input('wt_64');
        $questions_array = Question::all();
        return view('securityquestions.index', compact('user_id', 'questions_array', 'wt_64'));
    }

    public function email()
    {
        $email = "email@mail.com";
        $url = "http://google.com/";
        return view('emails.activateSecurityQuestions', compact('email', 'url'));
    }

    public function deconnectSecurityQuestions()
    {
        Auth::logout();
        return response()->json([
                'url' => $this->url_email . 'login'
            ], 200);
    }

    public function CkeckRowVerificationQuestions(Request $request)
    {
        $user = User::find($request->user_id);
        $question_id = $request->question_id;
        $password = decrypt($request->wt_64);
        $reponse = $request->input('reponse');

        $questrep = Questrep::where('user_id', '=', $user->id)
            ->where('question_id', '=', $question_id)
            ->whereRaw('LOWER(`reponse`) LIKE ? ', [trim(strtolower($reponse))])
            ->first();
                
        if($questrep)
        {
            if (Auth::attempt(['email' => $user->email, 'password' => $password]))
            {
                return response()->json([
                    'url' => $this->url_email . 'home'
                ], 200);
            }
        }
        else
        {
            return response()->json([
                'url' => $this->url_email . 'login'
            ], 404);
        }
    }

    public function sendEmailVerificationQuestionsPost(Request $request)
    {
        $user_id = $request->user_id;
        $user = User::find($user_id);
        if($user)
        {
            $user->active_security_questions = 0;
            $result_user = $user->saveOrFail();
            if($result_user) {
                $id_64 = encrypt($user->id_personne);
                $personne = Personne::find($user->id_personne);
                $personne->id_statuscompte = 4;
                $result_personne = $personne->saveOrFail();
                if($result_personne){
                    $email = $user->email;
                    $url = $this->url_email . "reactivateAccount/" . $id_64;
                    $data = array('name' => $personne->prenom . " " . $personne->nom, "url" => $url, "email" => $email);
                    Mail::send('emails.activateSecurityQuestions', $data, function($message) use ($data) {
                        $message->to($data['email'], $data['name'])
                            ->subject('Re-activate your account');
                        $message->from('c_atlas_app@atlas-c-trade.com','C-Atlas Application');
                    });
                    return response()->json([
                        'msg' => 'An email has been successfully sent to your mailbox !'
                    ], 200);
                }else{
                    return response()->json([
                        'msg' => 'Personne Action Failed !'
                    ], 500);
                }
            }else{
                return response()->json([
                    'msg' => 'User Action Failed !'
                ], 500);
            }
        }
        else
        {
            return response()->json([
                'msg' => 'Email not found !'
            ], 404);
        }
    }

    public function reactivateAccount(Request $request)
    {
        $id_64 = decrypt($request->id_64);
        $personne = Personne::find($id_64);
        if($personne)
        {
            $personne->id_statuscompte = 1;
            $result_personne = $personne->saveOrFail();

            if($result_personne){
                $reactivate_account_test = md5("yes_true_reactivate_account");
                return redirect()->route('login', ['reactivate_account_test' => $reactivate_account_test]);
            }else{
                $reactivate_account_test = md5("no_error_reactivate_account");
                return view('auth.login', compact('reactivate_account_test'));
            }
        }
        else
        {
            $reactivate_account_test = md5("no_email_reactivate_account");
            return view('auth.login', compact('reactivate_account_test'));
        }
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
