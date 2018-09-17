<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Pvbalancepersonne;
use App\Balanceaffiliation;
use App\Personne;
use Auth;

class AdminwithdrawalController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Withdrawal Requests Management";
        $nom_message_page = "Withdrawal Requests Management";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        return view('adminwithdrawal.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));
    }

    public function getListadminwithdrawals(){
        $user = Auth::user();
        $adminwithdrawals = Pvbalancepersonne::join('personnes', 'pvbalancepersonnes.id_personne', '=', 'personnes.id')
        ->join('balanceaffiliations', 'pvbalancepersonnes.id_balance_affiliation', '=', 'balanceaffiliations.id')
        ->select('pvbalancepersonnes.id', 'personnes.nom', 'personnes.prenom', 'balanceaffiliations.balance_affiliation', 'pvbalancepersonnes.type_payment', 'pvbalancepersonnes.montant_pvbalancepersonne', 'pvbalancepersonnes.status_pvbalancepersonne', 'pvbalancepersonnes.updated_at')
        ->orderBy('id', 'DESC')->get();
        return response()->json([
            'adminwithdrawals' => $adminwithdrawals
        ], 200);
    }

    public function getListwithdrawalsAdminHome(){
        $user = Auth::user();
        $withdrawals = Pvbalancepersonne::where('pvbalancepersonnes.status_pvbalancepersonne', '=', 0)
        ->join('personnes', 'pvbalancepersonnes.id_personne', '=', 'personnes.id')
        ->join('balanceaffiliations', 'pvbalancepersonnes.id_balance_affiliation', '=', 'balanceaffiliations.id')
        ->select('pvbalancepersonnes.id', 'personnes.nom', 'personnes.prenom', 'balanceaffiliations.balance_affiliation', 'pvbalancepersonnes.type_payment', 'pvbalancepersonnes.montant_pvbalancepersonne', 'pvbalancepersonnes.status_pvbalancepersonne', 'pvbalancepersonnes.updated_at')
        ->orderBy('id', 'DESC')->take(5)->get();
        return response()->json([
            'withdrawals' => $withdrawals
        ], 200);
    }

    public function updateStatusWithdrawAdmin(Request $request)
    {
        $pvbalancepersonne = Pvbalancepersonne::find($request->id_pvbalancepersonne);
        $pvbalancepersonne->status_pvbalancepersonne = $request->status_pvbalancepersonne;
        $result_pvbalancepersonne = $pvbalancepersonne->saveOrFail();
        if($result_pvbalancepersonne){
            if($request->status_pvbalancepersonne == 1)
            {
                $balanceaffiliation = Balanceaffiliation::find($pvbalancepersonne->id_balance_affiliation);
                $balanceaffiliation->balance_affiliation = $balanceaffiliation->balance_affiliation - $pvbalancepersonne->montant_pvbalancepersonne;
                $result_balanceaffiliation = $balanceaffiliation->saveOrFail();
                if($result_balanceaffiliation){
                    return response()->json([
                        'msg' => 'Successful action !'
                    ], 200);
                } else {
                    return response()->json([
                        'msg' => 'Failed action  !'
                    ], 500);
                }
            }
            return response()->json([
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 500);
        }
    }
}
