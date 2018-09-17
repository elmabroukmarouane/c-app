<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
// Log Connection Management
Route::get('/', 'authentification\LoginController@index')->name('login');
Route::get('login', 'authentification\LoginController@index')->name('login');
Route::post('login', 'authentification\LoginController@login')->name('login');
Route::get('logout', 'authentification\LoginController@logout')->name('logout');
Route::get('refresh-captch', 'authentification\LoginController@refreshCaptch')->name('refresh-captch');
Route::post('RegisterajoutOuModif', 'authentification\LoginController@ajoutOuModif')->name('RegisterajoutOuModif');
Route::get('RecoverPassword/{remember_token}', 'authentification\LoginController@RecoverPassword')->name('RecoverPassword');
Route::post('checkEmailSecurity', 'authentification\LoginController@checkEmailSecurity')->name('checkEmailSecurity');
Route::post('sendEmailRecoverPasswordPost', 'authentification\LoginController@sendEmailRecoverPasswordPost')->name('sendEmailRecoverPasswordPost');
Route::post('CkeckRowQuestrep', 'authentification\LoginController@CkeckRowQuestrep')->name('CkeckRowQuestrep');
Route::get('confirmCompte/{id_64}', 'authentification\LoginController@confirmCompte')->name('confirmCompte');
Route::get('home', 'HomeController@index')->name('home');
Route::get('homes', 'HomeController@homes')->name('homes');
//Route::get('onTradingNearFinish', 'HomeController@onTradingNearFinish')->name('onTradingNearFinish');
Route::get('getTotalSponsored/{id_personne}/{year}', 'HomeController@getTotalSponsored')->name('getTotalSponsored');
Route::get('getPostsHeader', 'HomeController@getPostsHeader')->name('getPostsHeader');
Route::get('posts-home', 'HomeController@posts')->name('posts-home');
Route::get('send-message', 'HomeController@SendMessage')->name('send-message');
Route::get('usercompanyaccounts', 'HomeController@usercompanyaccounts')->name('usercompanyaccounts');
Route::get('usercompanywallets', 'HomeController@usercompanywallets')->name('usercompanywallets');

// Security Questions Login Connection
Route::get('email-security-questions', 'SecurityquestionsController@email')->name('security-questions');
Route::get('security-questions', 'SecurityquestionsController@index')->name('security-questions');
Route::post('sendEmailVerificationQuestionsPost', 'SecurityquestionsController@sendEmailVerificationQuestionsPost')->name('sendEmailVerificationQuestionsPost');
Route::post('CkeckRowVerificationQuestions', 'SecurityquestionsController@CkeckRowVerificationQuestions')->name('CkeckRowVerificationQuestions');
/* Route::post('CkeckRowVerificationQuestions', 'SecurityquestionsController@CkeckRowVerificationQuestions')->name('CkeckRowVerificationQuestions'); */
Route::get('reactivateAccount/{id_64}', 'SecurityquestionsController@reactivateAccount')->name('reactivateAccount');
Route::get('deconnectSecurityQuestions', 'SecurityquestionsController@deconnectSecurityQuestions')->name('deconnectSecurityQuestions');

// Profil Management
Route::get('profil-page', 'ProfilController@index')->name('profil-page');
Route::post('updateProfilPage', 'ProfilController@updateProfilPage')->name('updateProfilPage');
Route::post('ProfilajoutOuModif', 'ProfilController@ajoutOuModif')->name('ProfilajoutOuModif');
Route::get('Profilmodifier/{id}', 'ProfilController@modifier')->name('Profilmodifier');
Route::get('ranking', 'ProfilController@ranking')->name('ranking');
Route::post('sendMessages', 'ProfilController@sendMessages')->name('sendMessages');

// Affiliate Management
Route::get('showAffiliate/{affiliate}', 'authentification\LoginController@showAffiliate')->name('showAffiliate');
Route::post('showAffiliate/RegisterajoutOuModif', 'authentification\LoginController@ajoutOuModif')->name('showAffiliate');

//Users Management
//Admins Management
Route::get('users', 'AdminsController@index')->name('users');
Route::get('get-users', 'AdminsController@admins')->name('get-users');
Route::post('ajoutOuModif', 'AdminsController@ajoutOuModif')->name('ajoutOuModif');
Route::get('modifier/{id}', 'AdminsController@modifier')->name('modifier');
Route::get('supprimer/{id}', 'AdminsController@supprimer')->name('supprimer');
Route::post('supprimer_all', 'AdminsController@supprimer_all')->name('supprimer_all');
Route::post('clear_table', 'AdminsController@clear_table')->name('clear_table');
Route::post('updateStatus', 'AdminsController@updateStatus')->name('updateStatus');
Route::get('generatePDF', 'AdminsController@generatePDF')->name('generatePDF');

// Networks Management
Route::get('networks', 'NetworksController@index')->name('networks');
//Route::get('getGraph', 'NetworksController@getGraph')->name('getGraph');
Route::get('getAffiliates', 'NetworksController@getAffiliates')->name('getAffiliates');
Route::get('getOntrading/{id}', 'NetworksController@getOntrading')->name('getOntrading');

// Trading Management
Route::get('trading', 'TradingController@index')->name('trading');
Route::get('getOntradingHistory/{id}', 'TradingController@getOntradingHistory')->name('getOntradingHistory');
Route::post('buyTradingPack', 'TradingController@buyTradingPack')->name('buyTradingPack');
Route::get('generatePDF_trading_active_packs', 'TradingController@generatePDF_trading_active_packs')->name('generatePDF_trading_active_packs');
Route::get('generatePDF_trading_history_packs', 'TradingController@generatePDF_trading_history_packs')->name('generatePDF_trading_history_packs');

// Cryptocrowding Management
Route::get('cryptocrowding', 'CryptocrowdingController@index')->name('cryptocrowding');

// Exchange Management
Route::get('exchange', 'ExchangeController@index')->name('exchange');

// Marketplace Management
Route::get('marketplace', 'MarketplaceController@index')->name('marketplace');

// SubscriptionPacks Management
Route::get('subscriptionpacks', 'SubscriptionPacksController@index')->name('trading');
Route::get('getSubscriptionPacksHistory/{id_personne}', 'SubscriptionPacksController@getSubscriptionPacksHistory')->name('getSubscriptionPacksHistory');
Route::post('buySubscriptionPack', 'SubscriptionPacksController@buySubscriptionPack')->name('buySubscriptionPack');

//Configurations Management
// --------------------------- BEGIN CONFIGURATION --------------------------------------//
//Tpersonnes Management
Route::get('tpersonnes', 'TpersonnesController@index')->name('tpersonnes');
Route::get('get-tpersonnes', 'TpersonnesController@getListtpersonnes')->name('get-tpersonnes');
Route::post('ajoutOuModif_tpersonnes', 'TpersonnesController@ajoutOuModif_tpersonnes')->name('ajoutOuModif_tpersonnes');
Route::get('modifier_tpersonnes/{id}', 'TpersonnesController@modifier_tpersonnes')->name('modifier_tpersonnes');
Route::get('supprimer_tpersonnes/{id}', 'TpersonnesController@supprimer_tpersonnes')->name('supprimer_tpersonnes');
Route::post('supprimer_all_tpersonnes', 'TpersonnesController@supprimer_all_tpersonnes')->name('supprimer_all_tpersonnes');
Route::post('clear_table_tpersonnes', 'TpersonnesController@clear_table_tpersonnes')->name('clear_table_tpersonnes');
Route::get('generatePDF_tpersonnes', 'TpersonnesController@generatePDF_tpersonnes')->name('generatePDF_tpersonnes');

//Statuscomptes Management
Route::get('statuscomptes', 'StatuscomptesController@index')->name('statuscomptes');
Route::get('get-statuscomptes', 'StatuscomptesController@getListstatuscomptes')->name('get-statuscomptes');
Route::post('ajoutOuModif_statuscomptes', 'StatuscomptesController@ajoutOuModif_statuscomptes')->name('ajoutOuModif_statuscomptes');
Route::get('modifier_statuscomptes/{id}', 'StatuscomptesController@modifier_statuscomptes')->name('modifier_statuscomptes');
Route::get('supprimer_statuscomptes/{id}', 'StatuscomptesController@supprimer_statuscomptes')->name('supprimer_statuscomptes');
Route::post('supprimer_all_statuscomptes', 'StatuscomptesController@supprimer_all_statuscomptes')->name('supprimer_all_statuscomptes');
Route::post('clear_table_statuscomptes', 'StatuscomptesController@clear_table_statuscomptes')->name('clear_table_statuscomptes');
Route::get('generatePDF_statuscomptes', 'StatuscomptesController@generatePDF_statuscomptes')->name('generatePDF_statuscomptes');

//Rankings Management
Route::get('rankings', 'RankingsController@index')->name('rankings');
Route::get('get-rankings', 'RankingsController@getListrankings')->name('get-rankings');
Route::post('ajoutOuModif_rankings', 'RankingsController@ajoutOuModif_rankings')->name('ajoutOuModif_rankings');
Route::get('modifier_rankings/{id}', 'RankingsController@modifier_rankings')->name('modifier_rankings');
Route::get('supprimer_rankings/{id}', 'RankingsController@supprimer_rankings')->name('supprimer_rankings');
Route::post('supprimer_all_rankings', 'RankingsController@supprimer_all_rankings')->name('supprimer_all_rankings');
Route::post('clear_table_rankings', 'RankingsController@clear_table_rankings')->name('clear_table_rankings');
Route::get('generatePDF_rankings', 'RankingsController@generatePDF_rankings')->name('generatePDF_rankings');

//Banks Management
Route::get('banks', 'BanksController@index')->name('banks');
Route::get('get-banks', 'BanksController@getListbanks')->name('get-banks');
Route::post('ajoutOuModif_banks', 'BanksController@ajoutOuModif_banks')->name('ajoutOuModif_banks');
Route::get('modifier_banks/{id}', 'BanksController@modifier_banks')->name('modifier_banks');
Route::get('supprimer_banks/{id}', 'BanksController@supprimer_banks')->name('supprimer_banks');
Route::post('supprimer_all_banks', 'BanksController@supprimer_all_banks')->name('supprimer_all_banks');
Route::post('clear_table_banks', 'BanksController@clear_table_banks')->name('clear_table_banks');
Route::get('generatePDF_banks', 'BanksController@generatePDF_banks')->name('generatePDF_banks');

//Currencies Management
Route::get('currencies', 'CurrenciesController@index')->name('currencies');
Route::get('get-currencies', 'CurrenciesController@getListcurrencies')->name('get-currencies');
Route::post('ajoutOuModif_currencies', 'CurrenciesController@ajoutOuModif_currencies')->name('ajoutOuModif_currencies');
Route::get('modifier_currencies/{id}', 'CurrenciesController@modifier_currencies')->name('modifier_currencies');
Route::get('supprimer_currencies/{id}', 'CurrenciesController@supprimer_currencies')->name('supprimer_currencies');
Route::post('supprimer_all_currencies', 'CurrenciesController@supprimer_all_currencies')->name('supprimer_all_currencies');
Route::post('clear_table_currencies', 'CurrenciesController@clear_table_currencies')->name('clear_table_currencies');
Route::get('generatePDF_currencies', 'CurrenciesController@generatePDF_currencies')->name('generatePDF_currencies');

// Company Bank Management
Route::get('companyaccounts', 'CompanyaccountsController@index')->name('companyaccounts');
Route::get('get-companyaccounts', 'CompanyaccountsController@getListcompanyaccounts')->name('get-companyaccounts');
Route::post('ajoutOuModif_companyaccounts', 'CompanyaccountsController@ajoutOuModif_companyaccounts')->name('ajoutOuModif_companyaccounts');
Route::get('modifier_companyaccounts/{id}', 'CompanyaccountsController@modifier_companyaccounts')->name('modifier_companyaccounts');
Route::get('show_account_companyaccounts/{id}', 'CompanyaccountsController@showCompanyaccount')->name('show_account_companyaccounts');
Route::get('supprimer_companyaccounts/{id}', 'CompanyaccountsController@supprimer_companyaccounts')->name('supprimer_companyaccounts');
Route::post('supprimer_all_companyaccounts', 'CompanyaccountsController@supprimer_all_companyaccounts')->name('supprimer_all_companyaccounts');
Route::post('clear_table_companyaccounts', 'CompanyaccountsController@clear_table_companyaccounts')->name('clear_table_companyaccounts');
Route::get('generatePDF_companyaccounts', 'CompanyaccountsController@generatePDF_companyaccounts')->name('generatePDF_companyaccounts');

// Company Wallet Management
Route::get('companywallets', 'CompanywalletsController@index')->name('companywallets');
Route::get('get-companywallets', 'CompanywalletsController@getListcompanywallets')->name('get-companywallets');
Route::post('ajoutOuModif_companywallets', 'CompanywalletsController@ajoutOuModif_companywallets')->name('ajoutOuModif_companywallets');
Route::get('modifier_companywallets/{id}', 'CompanywalletsController@modifier_companywallets')->name('modifier_companywallets');
Route::get('show_wallet_companywallets/{id}', 'CompanywalletsController@showCompanywallet')->name('show_wallet_companywallets');
Route::get('supprimer_companywallets/{id}', 'CompanywalletsController@supprimer_companywallets')->name('supprimer_companywallets');
Route::post('supprimer_all_companywallets', 'CompanywalletsController@supprimer_all_companywallets')->name('supprimer_all_companywallets');
Route::post('clear_table_companywallets', 'CompanywalletsController@clear_table_companywallets')->name('clear_table_companywallets');
Route::get('generatePDF_companywallets', 'CompanywalletsController@generatePDF_companywallets')->name('generatePDF_companywallets');

//Questions Management
Route::get('questions', 'QuestionsController@index')->name('questions');
Route::get('get-questions', 'QuestionsController@getListquestions')->name('get-questions');
Route::post('ajoutOuModif_questions', 'QuestionsController@ajoutOuModif_questions')->name('ajoutOuModif_questions');
Route::get('modifier_questions/{id}', 'QuestionsController@modifier_questions')->name('modifier_questions');
Route::get('supprimer_questions/{id}', 'QuestionsController@supprimer_questions')->name('supprimer_questions');
Route::post('supprimer_all_questions', 'QuestionsController@supprimer_all_questions')->name('supprimer_all_questions');
Route::post('clear_table_questions', 'QuestionsController@clear_table_questions')->name('clear_table_questions');

//Packabonnementplatforms Management
Route::get('packabonnementplatforms', 'PackabonnementplatformsController@index')->name('packabonnementplatforms');
Route::get('get-packabonnementplatforms', 'PackabonnementplatformsController@getListpackabonnementplatforms')->name('get-packabonnementplatforms');
Route::post('ajoutOuModif_packabonnementplatforms', 'PackabonnementplatformsController@ajoutOuModif_packabonnementplatforms')->name('ajoutOuModif_packabonnementplatforms');
Route::get('modifier_packabonnementplatforms/{id}', 'PackabonnementplatformsController@modifier_packabonnementplatforms')->name('modifier_packabonnementplatforms');

//Balanceaffiliationparameter Management
Route::get('balanceaffiliationparameters', 'BalanceaffiliationparametersController@index')->name('balanceaffiliationparameters');
Route::get('get-balanceaffiliationparameters', 'BalanceaffiliationparametersController@getListbalanceaffiliationparameters')->name('get-balanceaffiliationparameters');
Route::post('ajoutOuModif_balanceaffiliationparameters', 'BalanceaffiliationparametersController@ajoutOuModif_balanceaffiliationparameters')->name('ajoutOuModif_balanceaffiliationparameters');
Route::get('modifier_balanceaffiliationparameters/{id}', 'BalanceaffiliationparametersController@modifier_balanceaffiliationparameters')->name('modifier_balanceaffiliationparameters');

// --------------------------- END CONFIGURATION --------------------------------------//

// --------------------------- BEGIN SUBSCRIPTION --------------------------------------//

// Packs Management
Route::get('packs', 'PacksController@index')->name('packs');
Route::get('get-packs', 'PacksController@getListpacks')->name('get-packs');
Route::post('ajoutOuModif_packs', 'PacksController@ajoutOuModif_packs')->name('ajoutOuModif_packs');
Route::get('modifier_packs/{id}', 'PacksController@modifier_packs')->name('modifier_packs');
Route::get('supprimer_packs/{id}', 'PacksController@supprimer_packs')->name('supprimer_packs');
Route::post('supprimer_all_packs', 'PacksController@supprimer_all_packs')->name('supprimer_all_packs');
Route::post('clear_table_packs', 'PacksController@clear_table_packs')->name('clear_table_packs');
Route::get('generatePDF_packs', 'PacksController@generatePDF_packs')->name('generatePDF_packs');

// Activate Packs Management
Route::get('activate-packs', 'OntradingsController@index')->name('activate-packs');
Route::get('getOntrading_activate_Packs/{finished}/{active}', 'OntradingsController@getOntrading_activate_Packs')->name('getOntrading_activate_Packs');
Route::post('ajoutOuModif_activate_packs', 'OntradingsController@ajoutOuModif_activate_packs')->name('ajoutOuModif_activate_packs');
Route::post('updateStatus_activate_packs', 'OntradingsController@updateStatus_activate_packs')->name('updateStatus_activate_packs');
Route::get('modifier_activate_packs/{id}', 'OntradingsController@modifier_activate_packs')->name('modifier_activate_packs');
Route::get('supprimer_activate_packs/{id}', 'OntradingsController@supprimer_activate_packs')->name('supprimer_activate_packs');
Route::post('supprimer_all_activate_packs', 'OntradingsController@supprimer_all_activate_packs')->name('supprimer_all_activate_packs');
Route::post('clear_table_activate_packs', 'OntradingsController@clear_table_activate_packs')->name('clear_table_activate_packs');
Route::get('generatePDF_ontrading_packs', 'OntradingsController@generatePDF_ontrading_packs')->name('generatePDF_ontrading_packs');

// Abonnementplatforms Packs Management
Route::get('abonnementplatforms-packs', 'AbonnementplatformsController@index')->name('abonnementplatforms-packs');
Route::get('getabonnementplatforms_abonnementplatforms_Packs/{finished}', 'AbonnementplatformsController@getabonnementplatforms_abonnementplatforms_Packs')->name('getabonnementplatforms_abonnementplatforms_Packs');
Route::get('getabonnementplatforms_abonnementplatforms_Packs_active_id/{id_personne}', 'AbonnementplatformsController@getabonnementplatforms_abonnementplatforms_Packs_active_id')->name('getabonnementplatforms_abonnementplatforms_Packs_active_id');
Route::post('ajoutOuModif_abonnementplatforms_packs', 'AbonnementplatformsController@ajoutOuModif_abonnementplatforms_packs')->name('ajoutOuModif_abonnementplatforms_packs');
Route::post('updateStatus_abonnementplatforms_packs', 'AbonnementplatformsController@updateStatus_abonnementplatforms_packs')->name('updateStatus_abonnementplatforms_packs');
Route::get('modifier_abonnementplatforms_packs/{id}', 'AbonnementplatformsController@modifier_abonnementplatforms_packs')->name('modifier_abonnementplatforms_packs');
Route::get('supprimer_abonnementplatforms_packs/{id}', 'AbonnementplatformsController@supprimer_abonnementplatforms_packs')->name('supprimer_abonnementplatforms_packs');
Route::post('supprimer_all_abonnementplatforms_packs', 'AbonnementplatformsController@supprimer_all_abonnementplatforms_packs')->name('supprimer_all_abonnementplatforms_packs');
Route::post('clear_table_abonnementplatforms_packs', 'AbonnementplatformsController@clear_table_abonnementplatforms_packs')->name('clear_table_abonnementplatforms_packs');
Route::get('generatePDF_abonnementplatforms_packs', 'AbonnementplatformsController@generatePDF_abonnementplatforms_packs')->name('generatePDF_abonnementplatforms_packs');

//Withdrawal Management
Route::get('withdrawal', 'WithdrawalController@index')->name('withdrawal');
Route::get('get-withdrawals', 'WithdrawalController@getListwithdrawals')->name('get-withdrawals');
Route::get('get-balance-user', 'WithdrawalController@getBalanceUser')->name('get-balance-user');
Route::post('ajoutOuModif_withdrawals', 'WithdrawalController@ajoutOuModif_withdrawals')->name('ajoutOuModif_withdrawals');
Route::get('modifier_withdrawals/{id}', 'WithdrawalController@modifier_withdrawals')->name('modifier_withdrawals');

//Admin Withdrawal Management
Route::get('adminwithdrawal', 'AdminwithdrawalController@index')->name('adminwithdrawal');
Route::get('get-admin-home-withdrawals', 'AdminwithdrawalController@getListwithdrawalsAdminHome')->name('get-admin-home-withdrawals');
Route::post('updateStatusWithdrawAdmin', 'AdminwithdrawalController@updateStatusWithdrawAdmin')->name('updateStatusWithdrawAdmin');
Route::get('get-adminwithdrawals', 'AdminwithdrawalController@getListadminwithdrawals')->name('get-adminwithdrawals');
/* 
Route::get('get-balance-user', 'AdminwithdrawalController@getBalanceUser')->name('get-balance-user');
Route::get('modifier_withdrawals/{id}', 'AdminwithdrawalController@modifier_withdrawals')->name('modifier_withdrawals'); */

// --------------------------- END SUBSCRIPTION --------------------------------------//

// --------------------------- BEGIN INFORMATIONS --------------------------------------//

// User Bank Management
Route::get('bankaccounts', 'BankaccountsController@index')->name('bankaccounts');
Route::get('get-bankaccounts', 'BankaccountsController@getListbankaccounts')->name('get-bankaccounts');
Route::post('ajoutOuModif_bankaccounts', 'BankaccountsController@ajoutOuModif_bankaccounts')->name('ajoutOuModif_bankaccounts');
Route::get('modifier_bankaccounts/{id}', 'BankaccountsController@modifier_bankaccounts')->name('modifier_bankaccounts');
Route::get('supprimer_bankaccounts/{id}', 'BankaccountsController@supprimer_bankaccounts')->name('supprimer_bankaccounts');
Route::post('supprimer_all_bankaccounts', 'BankaccountsController@supprimer_all_bankaccounts')->name('supprimer_all_bankaccounts');
Route::post('clear_table_bankaccounts', 'BankaccountsController@clear_table_bankaccounts')->name('clear_table_bankaccounts');
Route::get('generatePDF_bankaccounts', 'BankaccountsController@generatePDF_bankaccounts')->name('generatePDF_bankaccounts');

// User Bank Wallets Management
Route::get('bankwallets', 'BankwalletsController@index')->name('bankwallets');
Route::get('get-bankwallets', 'BankwalletsController@getListbankwallets')->name('get-bankwallets');
Route::post('ajoutOuModif_bankwallets', 'BankwalletsController@ajoutOuModif_bankwallets')->name('ajoutOuModif_bankwallets');
Route::get('modifier_bankwallets/{id}', 'BankwalletsController@modifier_bankwallets')->name('modifier_bankwallets');
Route::get('supprimer_bankwallets/{id}', 'BankwalletsController@supprimer_bankwallets')->name('supprimer_bankwallets');
Route::post('supprimer_all_bankwallets', 'BankwalletsController@supprimer_all_bankwallets')->name('supprimer_all_bankwallets');
Route::post('clear_table_bankwallets', 'BankwalletsController@clear_table_bankwallets')->name('clear_table_bankwallets');
Route::get('generatePDF_bankwallets', 'BankwalletsController@generatePDF_bankwallets')->name('generatePDF_bankwallets');

// User Questreps Management
Route::get('questreps', 'QuestrepsController@index')->name('questreps');
Route::get('get-questreps', 'QuestrepsController@getListquestreps')->name('get-questreps');
Route::get('get-questions-distinct', 'QuestrepsController@getQuestionsDistinct')->name('get-questions-distinct');
Route::get('get-questions-distinct-id/{user_id}', 'QuestrepsController@getQuestionsDistinctId')->name('get-questions-distinct-id');
Route::get('get-row-questrep/{question_id}', 'QuestrepsController@getRowQuestrep')->name('get-row-questrep');
Route::post('get-row-questrep-login', 'QuestrepsController@getRowQuestrepLogin')->name('get-row-questrep');
Route::get('modifier_questreps/{id}', 'QuestrepsController@modifier_questreps')->name('modifier_questreps');
Route::post('add_questreps', 'QuestrepsController@add_questreps')->name('add_questreps');
Route::post('edit_questreps', 'QuestrepsController@edit_questreps')->name('edit_questreps');
Route::get('supprimer_questreps/{id}', 'QuestrepsController@supprimer_questreps')->name('supprimer_questreps');

// --------------------------- END INFORMATIONS --------------------------------------//

// --------------------------- BEGIN SUPPORT TICKETS --------------------------------------//

//Supporttickets Management
Route::get('supporttickets-users', 'SupportticketsController@index')->name('supporttickets-users');
Route::get('supporttickets-admins', 'SupportticketsController@supporttickets_admins')->name('supporttickets-admins');
Route::get('get-supporttickets-users', 'SupportticketsController@getListsupportticketsusers')->name('get-supporttickets-users');
Route::get('get-supporttickets-admins', 'SupportticketsController@getListsupportticketsadmins')->name('get-supporttickets-admins');
Route::post('ajoutOuModif_supporttickets-users', 'SupportticketsController@ajoutOuModif_supportticketsusers')->name('ajoutOuModif_supporttickets-users');
Route::post('ajoutOuModif_supporttickets-admins', 'SupportticketsController@ajoutOuModif_supportticketsadmins')->name('ajoutOuModif_supporttickets-admins');
Route::get('get_status_supportticket/{id}', 'SupportticketsController@get_status_supportticket')->name('get_status_supportticket');
Route::post('updateStatus_supporttickets', 'SupportticketsController@updateStatus_supporttickets')->name('updateStatus_supporttickets');
Route::get('list_supportticketmessages/{id_supportticket}', 'SupportticketsController@list_supportticketmessages')->name('list_supportticketmessages');
Route::get('supprimer_supporttickets/{id}', 'SupportticketsController@supprimer_supporttickets')->name('supprimer_supporttickets');
Route::post('supprimer_all_supporttickets', 'SupportticketsController@supprimer_all_supporttickets')->name('supprimer_all_supporttickets');
Route::post('clear_table_supporttickets', 'SupportticketsController@clear_table_supporttickets')->name('clear_table_supporttickets');

// --------------------------- END SUPPORT TICKETS --------------------------------------//

//Posts Management
Route::get('posts', 'PostsController@index')->name('posts');
Route::get('get-posts', 'PostsController@getListposts')->name('get-posts');
Route::post('ajoutOuModif_posts', 'PostsController@ajoutOuModif_posts')->name('ajoutOuModif_posts');
Route::get('modifier_posts/{id}', 'PostsController@modifier_posts')->name('modifier_posts');
Route::get('supprimer_posts/{id}', 'PostsController@supprimer_posts')->name('supprimer_posts');
Route::post('supprimer_all_posts', 'PostsController@supprimer_all_posts')->name('supprimer_all_posts');
Route::post('clear_table_posts', 'PostsController@clear_table_posts')->name('clear_table_posts');

// Messages Management
Route::get('messages', 'MessagesController@index')->name('messages');
Route::get('get-messages', 'MessagesController@getListmessages')->name('get-messages');
//Route::post('ajoutOuModif_messages', 'MessagesController@ajoutOuModif_messages')->name('ajoutOuModif_messages');
Route::get('modifier_messages/{id}', 'MessagesController@modifier_messages')->name('modifier_messages');
Route::get('supprimer_messages/{id}', 'MessagesController@supprimer_messages')->name('supprimer_messages');
Route::post('supprimer_all_messages', 'MessagesController@supprimer_all_messages')->name('supprimer_all_messages');
Route::post('clear_table_messages', 'MessagesController@clear_table_messages')->name('clear_table_messages');

// Admin User Bank Management
Route::get('admin_bankaccounts', 'AdminbankaccountsController@index')->name('admin_bankaccounts');
Route::get('get-admin-users-accounts-list', 'AdminbankaccountsController@getAdminusersaccountslist')->name('get-admin-users-accounts-list');
Route::get('get-admin_bankaccounts/{id_personne}', 'AdminbankaccountsController@getListadmin_bankaccounts')->name('get-admin_bankaccounts');
Route::get('generatePDF_admin_bankaccounts/{id_personne}', 'AdminbankaccountsController@generatePDF_admin_bankaccounts')->name('generatePDF_admin_bankaccounts');

// Admin User Wallet Management
Route::get('admin_bankwallets', 'AdminbankwalletsController@index')->name('admin_bankwallets');
Route::get('get-admin-users-wallets-list', 'AdminbankwalletsController@getAdminuserswalletslist')->name('get-admin-users-wallets-list');
Route::get('get-admin_bankwallets/{id_personne}', 'AdminbankwalletsController@getListadmin_bankwallets')->name('get-admin_bankwallets');
Route::get('generatePDF_admin_bankwallets/{id_personne}', 'AdminbankwalletsController@generatePDF_admin_bankwallets')->name('generatePDF_admin_bankwallets');

//Balance Affiliate Management
Route::get('balanceaffiliations', 'BalanceaffiliationsController@index')->name('balanceaffiliations');
Route::get('get-balanceaffiliations', 'BalanceaffiliationsController@getListbalanceaffiliations')->name('get-balanceaffiliations');
Route::post('ajoutOuModif_balanceaffiliations', 'BalanceaffiliationsController@ajoutOuModif_balanceaffiliations')->name('ajoutOuModif_balanceaffiliations');
Route::post('ajoutOuModifByRanking_balanceaffiliations', 'BalanceaffiliationsController@ajoutOuModifByRanking_balanceaffiliations')->name('ajoutOuModifByRanking_balanceaffiliations');
Route::get('getBalanceAffiliationByPersonne/{id_personne}', 'BalanceaffiliationsController@getBalanceAffiliationByPersonne')->name('getBalanceAffiliationByPersonne');
Route::get('modifier_balanceaffiliations/{id}', 'BalanceaffiliationsController@modifier_balanceaffiliations')->name('modifier_balanceaffiliations');
Route::get('generatePDF_balanceaffiliations', 'BalanceaffiliationsController@generatePDF_balanceaffiliations')->name('generatePDF_balanceaffiliations');

//Balance Bitcoin Management
Route::get('balancebitcoins', 'BalancebitcoinsController@index')->name('balancebitcoins');
Route::get('get-balancebitcoins', 'BalancebitcoinsController@getListbalancebitcoins')->name('get-balancebitcoins');
Route::post('ajoutOuModif_balancebitcoins', 'BalancebitcoinsController@ajoutOuModif_balancebitcoins')->name('ajoutOuModif_balancebitcoins');
Route::post('ajoutOuModifByRanking_balancebitcoins', 'BalancebitcoinsController@ajoutOuModifByRanking_balancebitcoins')->name('ajoutOuModifByRanking_balancebitcoins');
Route::get('modifier_balancebitcoins/{id}', 'BalancebitcoinsController@modifier_balancebitcoins')->name('modifier_balancebitcoins');
Route::get('generatePDF_balancebitcoins', 'BalancebitcoinsController@generatePDF_balancebitcoins')->name('generatePDF_balancebitcoins');