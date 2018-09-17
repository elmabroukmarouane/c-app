<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Pvbalancepersonne;
use App\Balanceaffiliation;
use App\Personne;
use Auth;

class WithdrawalController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function index()
    {
        $user = Auth::user();
        $personne = Personne::find($user->id_personne);
        $nom_page = "Withdrawal";
        $nom_message_page = "Withdrawal";
        $personne_info_encrypt = encrypt($personne->id . "_" . $personne->nom . "_" . $personne->prenom . "_" . $personne->date_naissance);
        try {
            $personne_info_decrypted = decrypt($personne_info_encrypt);
        } catch (DecryptException $e) {
            die($e);
        }
        return view('withdrawal.index', compact('user', 'personne', 'nom_page', 'nom_message_page', 'personne_info_encrypt'));
    }

    public function getListwithdrawals(){
        $user = Auth::user();
        $withdrawals = Pvbalancepersonne::where('pvbalancepersonnes.id_personne', '=', $user->id_personne)
        ->join('personnes', 'pvbalancepersonnes.id_personne', '=', 'personnes.id')
        ->join('balanceaffiliations', 'pvbalancepersonnes.id_balance_affiliation', '=', 'balanceaffiliations.id')
        ->select('pvbalancepersonnes.id', 'personnes.nom', 'personnes.prenom', 'balanceaffiliations.balance_affiliation', 'pvbalancepersonnes.type_payment', 'pvbalancepersonnes.montant_pvbalancepersonne', 'pvbalancepersonnes.status_pvbalancepersonne', 'pvbalancepersonnes.updated_at')
        ->orderBy('id', 'DESC')->get();
        return response()->json([
            'withdrawals' => $withdrawals
        ], 200);
    }

    public function getBalanceUser(){
        $user = Auth::user();
        $balanceaffiliation = Balanceaffiliation::where('id_personne', '=', $user->id_personne)->first();
        $withdrawals = Pvbalancepersonne::where('id_personne', '=', $user->id_personne)
        ->where('status_pvbalancepersonne', '=', '0')
        ->orderBy('id', 'DESC')->get();
        $total_montant_pvbalancepersonne = 0;
        foreach($withdrawals as $withdrawal)
        {
            $total_montant_pvbalancepersonne += $withdrawal->montant_pvbalancepersonne;
        }
        return response()->json([
            'balanceaffiliation' => $balanceaffiliation,
            'total_montant_pvbalancepersonne' => $total_montant_pvbalancepersonne
        ], 200);
    }

    public function ajoutOuModif_withdrawals(Request $request){
        $user = Auth::user();
        $pvbalancepersonne = new Pvbalancepersonne();
        $pvbalancepersonne->id_personne = $user->id_personne;
        $pvbalancepersonne->id_balance_affiliation = $request->id_balance_affiliation;
        $pvbalancepersonne->type_payment = $request->type_payment;
        $pvbalancepersonne->montant_pvbalancepersonne = $request->montant_pvbalancepersonne;
        $pvbalancepersonne->status_pvbalancepersonne = 0;
        $result_pvbalancepersonne = $pvbalancepersonne->saveOrFail();

        if($result_pvbalancepersonne){

            $withdrawal = Pvbalancepersonne::where('pvbalancepersonnes.id', '=', $pvbalancepersonne->id)
            ->join('personnes', 'pvbalancepersonnes.id_personne', '=', 'personnes.id')
            ->join('balanceaffiliations', 'pvbalancepersonnes.id_balance_affiliation', '=', 'balanceaffiliations.id')
            ->select('pvbalancepersonnes.id', 'personnes.nom', 'personnes.prenom', 'balanceaffiliations.balance_affiliation', 'pvbalancepersonnes.type_payment', 'pvbalancepersonnes.montant_pvbalancepersonne', 'pvbalancepersonnes.status_pvbalancepersonne', 'pvbalancepersonnes.updated_at')
            ->first();

            return response()->json([
                'withdrawal' => $withdrawal,
                'msg' => 'Successful action !'
            ], 200);
        }else{
            return response()->json([
                'msg' => 'Failed action  !'
            ], 200);
        }
    }

    public function modifier_withdrawals(Request $request)
    {
        $withdrawal = withdrawal::find($request->id);
        if(!$withdrawal){
            return response()->json([
                'msg' => 'withdrawal Introuvable !'
            ], 200);
        }
        return response()->json([
            'withdrawal'  => $withdrawal
        ], 200);
    }
}
