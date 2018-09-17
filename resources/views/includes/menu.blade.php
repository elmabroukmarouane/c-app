<!-- ============================================================== -->
<!-- Left Sidebar - style you can find in sidebar.scss  -->
<!-- ============================================================== -->
<aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <?php $tpersonne_page_menu = \App\Tpersonne::find($personne->id_tpersonne); ?>
    <div class="scroll-sidebar">
        <!-- User profile -->
        <div class="user-profile" style="background: url(assets/images/background/user-info.jpg) no-repeat;">
            <!-- User profile image -->
            <div class="profile-img" id="div_image_menu"><img src="divers/images/images_admins/{{$personne->image}}"  alt="{{$personne->prenom}} {{$personne->nom}}" /></div>
            <!-- User profile text-->
            {{--  <div class="profile-text"> <a href="#" class="dropdown-toggle u-dropdown" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true" id="div_nom_menu">{{$personne->prenom}} {{$personne->nom}}</a>  --}}
            <div class="profile-text"> <a>{{$personne->prenom}} {{$personne->nom}}</a>
                <div class="dropdown-menu animated flipInY">
                    @if($tpersonne_page_menu->tpersonne == "Member")
                    <a href="javascript:void(0)" class="dropdown-item"><span id="span_raking_user"></span></a>
                    <div class="dropdown-divider"></div>
                    @endif
                    <a href="javascript:void(0)" onclick="Profilmodifier({{$personne->id}})" class="dropdown-item"><i class="ti-user"></i> My Profile</a>
                    <!-- <a href="#" class="dropdown-item"><i class="ti-wallet"></i> My Balance</a>
                    <a href="#" class="dropdown-item"><i class="ti-email"></i> Inbox</a>
                    <div class="dropdown-divider"></div> <a href="#" class="dropdown-item"><i class="ti-settings"></i> Account Setting</a> -->
                    <div class="dropdown-divider"></div> <a href="javascript:void(0)" onclick="$('#modal-fullscreen').modal('show');" class="dropdown-item"><i class="fa fa-power-off"></i> Logout</a>
                </div>
            </div>
        </div>
        <!-- End User profile text-->
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav">
            <ul id="sidebarnav">
                <br />
                <li @if($nom_page == "Home") class="active" @endif><a class="waves-effect waves-dark" href="homes"><i class="mdi mdi-gauge"></i>&nbsp;&nbsp;Dashboard</a></li>
                @if($tpersonne_page_menu->tpersonne == "Member" && ($personne->id_statuscompte == 1 || $personne->id_statuscompte == 3))
                <li @if($nom_page == "My Subscription Packages") class="active" @endif>
                        <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-shopping-basket"></i><span class="hide-menu">&nbsp;&nbsp;Subscriptions</span></a>
                        <ul aria-expanded="false" class="collapse">
                            {{-- @if($nom_page == "My Subscription Packages") --}}
                            <li><a onclick="show_subscription_pack_modal({{ $personne->id }}, '1')" href="javascript:void(0)">Buy Service</a></li>
                            {{-- @endif --}}
                            <li><a @if($nom_page == "My Subscription Packages") class="active" @endif href="subscriptionpacks">My Packages</a></li>
                        </ul>
                    </li>
                @endif
                @if($tpersonne_page_menu->tpersonne == "Member" && $personne->id_statuscompte == 1)
                    <!--<li @if($nom_page == "My Subscription Packages") class="active" @endif><a class="waves-effect waves-dark" href="subscriptionpacks"><i class="fa fa-shopping-basket"></i>&nbsp;&nbsp;Subscription Packages</a></li>-->
                    <li @if($nom_page == "Account Management" || $nom_page == "Banks Account Management") class="active" @endif>
                        <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-vcard-o "></i>&nbsp;<span class="hide-menu">My Account</span></a>
                        <ul aria-expanded="false" class="collapse">
                        <!--<li @if($nom_page == "Account Management") class="active" @endif>
                            <a class="has-arrow" href="#" aria-expanded="false"><i class="ti-user"></i> Profil</a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a href="javascript:void(0)" onclick="Profilmodifier({{$personne->id}})"> Update</a></li>
                            </ul>
                        </li> onclick="Profilmodifier({{$personne->id}})"-->
                            <li @if($nom_page == "Account Management") class="active" @endif><a class="waves-effect waves-dark" href="profil-page"><i class="ti-user"></i>&nbsp;&nbsp;Update Profil</a></li>
                        <!--<li @if($nom_page == "Banks Account Management") class="active" @endif>
                            <a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-bank"></i> Banks Accounts</a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a  @if($nom_page == "Bank Account Management") class="active" @endif href="bankaccounts">Management</a></li>
                            </ul>
                        </li>-->
                            <li @if($nom_page == "Bank Account Management") class="active" @endif><a class="waves-effect waves-dark" href="bankaccounts"><i class="fa fa-bank"></i>&nbsp;&nbsp;Banks Accounts</a></li>
                        <!--<li @if($nom_page == "Wallets Management") class="active" @endif>
                            <a class="has-arrow" href="#" aria-expanded="false"><i class="ti-wallet"></i> Wallets</a>
                            <ul aria-expanded="false" class="collapse">
                                <li><a  @if($nom_page == "Wallets Management") class="active" @endif href="bankwallets">Management</a></li>
                            </ul>
                        </li>-->
                            <li @if($nom_page == "Wallets Management") class="active" @endif><a class="waves-effect waves-dark" href="bankwallets"><i class="ti-wallet"></i>&nbsp;&nbsp;Wallets</a></li>
                            <li @if($nom_page == "Security Questions Management") class="active" @endif><a class="waves-effect waves-dark" href="questreps"><i class="fa fa-question"></i>&nbsp;&nbsp;Security Questions</a></li>
                        </ul>
                    </li>
                <!--<li @if($nom_page == "My Network") class="active" @endif>
                    <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-sitemap"></i><span class="hide-menu">My Network</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a @if($nom_page == "My Network") class="active" @endif href="networks">Network & Sponsors</a></li>
                    </ul>
                </li>-->
                <li @if($nom_page == "My Network") class="active" @endif><a class="waves-effect waves-dark" href="networks"><i class="fa fa-sitemap"></i>&nbsp;&nbsp;My Network</a></li>
                <!--<li @if($nom_page == "Trading Account") class="active" @endif>
                    <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-bitcoin"></i><span class="hide-menu">Trading Account</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a @if($nom_page == "Trading Account") class="active" @endif href="trading">Trading Package</a></li>
                    </ul>
                </li>-->
                <li @if($nom_page == "Trading Account") class="active" @endif>
                    <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-bitcoin"></i><span class="hide-menu">Trading Account</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a @if($nom_page == "Trading Account") class="active" @endif href="trading">Trading Packages</a></li>
                        <li><a @if($nom_page == "Trading Training") class="active" @endif href="posts-home">Trading Training</a></li><!-- class="active"  -->
                    </ul>
                </li>
                {{-- <li @if($nom_page == "Trading Account") class="active" @endif><a class="waves-effect waves-dark" href="trading"><i class="fa fa-bitcoin"></i>&nbsp;&nbsp;Trading Account</a></li> --}}
                <li><a class="waves-effect waves-dark" href="exchange" target="_blank"><i class="fa fa-exchange"></i>&nbsp;&nbsp;Exchange</a></li>
                <li><a class="waves-effect waves-dark" href="marketplace" target="_blank"><i class="fa fa-shopping-cart"></i>&nbsp;&nbsp;Market Place</a></li>
                <li><a class="waves-effect waves-dark" href="cryptocrowding" target="_blank"><i class="mdi mdi-cash-multiple"></i>&nbsp;&nbsp;Crypto-Crowding</a></li>
                <li @if($nom_page == "Withdrawal") class="active" @endif><a class="waves-effect waves-dark" href="withdrawal"><i class="fa fa-credit-card"></i>&nbsp;&nbsp;Withdrawal</a></li>
                @endif
                @if($tpersonne_page_menu->tpersonne == "Member" && $personne->id_statuscompte == 1)
                {{-- <li @if($nom_page == "Admin Posts" || $nom_page == "Send Message" || $nom_page == "Company Accounts" || $nom_page == "Company Wallets") class="active" @endif><!-- class="active"  -->
                    <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-comments"></i><span class="hide-menu">&nbsp;Admin</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <!--<li><a @if($nom_page == "Send Message") class="active" @endif href="send-message">Send Message</a></li> -->
                        <li><a @if($nom_page == "Company Accounts") class="active" @endif href="usercompanyaccounts">Company Accounts</a></li><!-- class="active"  -->
                        <li><a @if($nom_page == "Company Wallets") class="active" @endif href="usercompanywallets">Company Wallets</a></li><!-- class="active"  -->
                    </ul>
                </li> --}}
                <!--<li @if($nom_page == "User Support Tickets") class="active" @endif>
                    <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-folder-open-o"></i><span class="hide-menu">Support Tickets</span></a>
                    <ul aria-expanded="false" class="collapse">
                        <li><a @if($nom_page == "User Support Tickets") class="active" @endif href="supporttickets-users">Open</a></li>
                    </ul>
                </li>-->
				@endif
				@if($tpersonne_page_menu->tpersonne == "Member" && ($personne->id_statuscompte == 1 || $personne->id_statuscompte == 3))
                <li @if($nom_page == "User Support Tickets") class="active" @endif><a class="waves-effect waves-dark" href="supporttickets-users"><i class="fa fa-folder-open-o"></i>&nbsp;&nbsp;Open Ticket</a></li>
                @endif
                @if($tpersonne_page_menu->tpersonne == "Admin" || $tpersonne_page_menu->tpersonne == "Super Admin")
                    <li @if($nom_page == "Packs Management" || $nom_page == "Users Packs") class="active" @endif>
                        <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-handshake-o"></i>&nbsp;<span class="hide-menu">Subscriptions</span></a>
                        <ul aria-expanded="false" class="collapse">
                            <!--<li @if($nom_page == "Packs Management") class="active" @endif>
                                <a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-shopping-basket"></i> Packs</a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a  @if($nom_page == "Packs Management") class="active" @endif href="packs">Management</a></li>
                                </ul>
                            </li>-->
                            <li @if($nom_page == "Packs Management") class="active" @endif><a class="waves-effect waves-dark" href="packs"><i class="fa fa-shopping-basket"></i>&nbsp;&nbsp;Packs</a></li>
                            <li @if($nom_page == "Platform User Packs Management") class="active" @endif><a class="waves-effect waves-dark" href="abonnementplatforms-packs"><i class="fa fa-shopping-basket"></i>&nbsp;&nbsp;Platform User Packs</a></li>
                            <!--<li @if($nom_page == "Users Packs") class="active" @endif>
                                <a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-shopping-basket"></i> Users Packs</a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a  @if($nom_page == "Users Packs") class="active" @endif href="activate-packs">Activate Packs</a></li>
                                </ul>
                            </li>-->
                            <li @if($nom_page == "Users Packs") class="active" @endif><a class="waves-effect waves-dark" href="activate-packs"><i class="fa fa-shopping-basket"></i>&nbsp;&nbsp;Trading Users Packs</a></li>
                        </ul>
                    </li>
                    <!--<li @if($nom_page == "Users Management") class="active" @endif>
                        <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-address-book-o"></i><span class="hide-menu">Users</span></a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a @if($nom_page == "Users Management") class="active" @endif href="users">Users List</a></li>
                        </ul>
                    </li>-->
                    <li @if($nom_page == "Users Management") class="active" @endif><a class="waves-effect waves-dark" href="users"><i class="fa fa-address-book-o"></i>&nbsp;&nbsp;Users</a></li>
                    <li @if($nom_page == "Withdrawal Requests Management") class="active" @endif><a class="waves-effect waves-dark" href="adminwithdrawal"><i class="fa fa-list"></i>&nbsp;&nbsp;Withdrawal Requests</a></li>
                    <!--<li @if($nom_page == "Posts Management") class="active" @endif>
                        <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-comments"></i><span class="hide-menu">Posts</span></a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a @if($nom_page == "Posts Management") class="active" @endif href="posts">Posts List</a></li>
                        </ul>
                    </li>-->
                    <li @if($nom_page == "Posts Management") class="active" @endif><a class="waves-effect waves-dark" href="posts"><i class="fa fa-comments"></i>&nbsp;&nbsp;Posts</a></li>
                    <!--<li @if($nom_page == "Messages Management") class="active" @endif>
                        <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-envelope-o"></i><span class="hide-menu">Messages</span></a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a @if($nom_page == "Messages Management") class="active" @endif href="messages">Messages List</a></li>
                        </ul>
                    </li>-->
                    <li @if($nom_page == "Admin Accounts Management" || $nom_page == "Admin Wallets Management") class="active" @endif>
                        <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-vcard-o "></i>&nbsp;<span class="hide-menu">Users Accounts</span></a>
                        <ul aria-expanded="false" class="collapse">
                            <!--<li @if($nom_page == "Admin Accounts Management") class="active" @endif>
                                <a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-bank"></i> Banks Accounts</a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a  @if($nom_page == "Admin Accounts Management") class="active" @endif href="admin_bankaccounts">List</a></li>
                                </ul>
                            </li>-->
                            <li @if($nom_page == "Admin Accounts Management") class="active" @endif><a class="waves-effect waves-dark" href="admin_bankaccounts"><i class="fa fa-bank"></i>&nbsp;&nbsp;Banks Accounts</a></li>
                            <!--<li @if($nom_page == "Admin Wallets Management") class="active" @endif>
                                <a class="has-arrow" href="#" aria-expanded="false"><i class="ti-wallet"></i> Wallets</a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a  @if($nom_page == "Admin Wallets Management") class="active" @endif href="admin_bankwallets">List</a></li>
                                </ul>
                            </li>-->
                            <li @if($nom_page == "Admin Wallets Management") class="active" @endif><a class="waves-effect waves-dark" href="admin_bankwallets"><i class="ti-wallet"></i>&nbsp;&nbsp;Wallets</a></li>
                            <li @if($nom_page == "Balance Affiliate Management") class="active" @endif><a class="waves-effect waves-dark" href="balanceaffiliations"><i class="fa fa-money"></i>&nbsp;&nbsp;Balance Affiliate</a></li>
                            <li @if($nom_page == "Balance Bitcoin Management") class="active" @endif><a class="waves-effect waves-dark" href="balancebitcoins"><i class="fa fa-bitcoin"></i>&nbsp;&nbsp;Balance Bitcoin</a></li>
                        </ul>
                    </li>
                    <!--<li @if($nom_page == "Admin Support Tickets") class="active" @endif>
                        <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-folder-open-o"></i><span class="hide-menu">Support Tickets</span></a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a @if($nom_page == "Admin Support Tickets") class="active" @endif href="supporttickets-admins">Open</a></li>
                        </ul>
                    </li>-->
                    <li @if($nom_page == "Admin Support Tickets") class="active" @endif><a class="waves-effect waves-dark" href="supporttickets-admins"><i class="fa fa-folder-open-o"></i>&nbsp;&nbsp;Support Tickets</a></li>
                    <li @if($nom_page == "Company Accounts Management" || $nom_page == "Company Wallets Management" || $nom_page == "Users Type Management" || $nom_page == "Status Type Management" || $nom_page == "Ranking Management" || $nom_page == "Banks Management" || $nom_page == "Currencies Management") class="active" @endif>
                        <a class="has-arrow waves-effect waves-dark" href="#" aria-expanded="false"><i class="fa fa-cogs"></i><span class="hide-menu">Configurations</span></a>
                        <ul aria-expanded="false" class="collapse">
                            <!--<li @if($nom_page == "Company Accounts Management") class="active" @endif>
                                <a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-credit-card"></i> Company Account</a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a  @if($nom_page == "Company Accounts Management") class="active" @endif href="companyaccounts">Management</a></li>
                                </ul>
                            </li>-->
                            <li @if($nom_page == "Company Accounts Management") class="active" @endif><a class="waves-effect waves-dark" href="companyaccounts"><i class="fa fa-credit-card"></i>&nbsp;&nbsp;Company Accounts</a></li>
                            <!--<li @if($nom_page == "Company Wallets Management") class="active" @endif>
                                <a class="has-arrow" href="#" aria-expanded="false"><i class="ti-wallet"></i> Company Wallets</a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a  @if($nom_page == "Company Wallets Management") class="active" @endif href="companywallets">Management</a></li>
                                </ul>
                            </li>-->
                            <li @if($nom_page == "Company Wallets Management") class="active" @endif><a class="waves-effect waves-dark" href="companywallets"><i class="ti-wallet"></i>&nbsp;&nbsp;Company Wallets</a></li>
                            <!--<li @if($nom_page == "Users Type Management") class="active" @endif>
                                <a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-flag"></i> Users Type</a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a  @if($nom_page == "Users Type Management") class="active" @endif href="tpersonnes">Management</a></li>
                                </ul>
                            </li>-->
                            <li @if($nom_page == "Users Type Management") class="active" @endif><a class="waves-effect waves-dark" href="tpersonnes"><i class="fa fa-flag"></i>&nbsp;&nbsp;Users Type</a></li>
                            <!--<li @if($nom_page == "Status Type Management") class="active" @endif>
                                <a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-check-square-o"></i> Status Type</a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a  @if($nom_page == "Status Type Management") class="active" @endif href="statuscomptes">Management</a></li>
                                </ul>
                            </li>-->
                            <li @if($nom_page == "Status Type Management") class="active" @endif><a class="waves-effect waves-dark" href="statuscomptes"><i class="fa fa-check-square-o"></i>&nbsp;&nbsp;Status Type</a></li>
                            <!--<li @if($nom_page == "Ranking Management") class="active" @endif>
                                <a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-star"></i> Rankings</a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a  @if($nom_page == "Ranking Management") class="active" @endif href="rankings">Management</a></li>
                                </ul>
                            </li>-->
                            <li @if($nom_page == "Ranking Management") class="active" @endif><a class="waves-effect waves-dark" href="rankings"><i class="fa fa-star"></i>&nbsp;&nbsp;Rankings</a></li>
                            <!--<li @if($nom_page == "Banks Management") class="active" @endif>
                                <a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-bank"></i> Banks</a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a  @if($nom_page == "Banks Management") class="active" @endif href="banks">Management</a></li>
                                </ul>
                            </li>-->
                            <li @if($nom_page == "Banks Management") class="active" @endif><a class="waves-effect waves-dark" href="banks"><i class="fa fa-bank"></i>&nbsp;&nbsp;Banks</a></li>
                            <!--<li @if($nom_page == "Currencies Management") class="active" @endif>
                                <a class="has-arrow" href="#" aria-expanded="false"><i class="fa fa-money"></i> Currencies</a>
                                <ul aria-expanded="false" class="collapse">
                                    <li><a  @if($nom_page == "Currencies Management") class="active" @endif href="currencies">Management</a></li>
                                </ul>
                            </li>-->
                            <li @if($nom_page == "Currencies Management") class="active" @endif><a class="waves-effect waves-dark" href="currencies"><i class="fa fa-money"></i>&nbsp;&nbsp;Currencies</a></li>
                            <li @if($nom_page == "Security Questions Management") class="active" @endif><a class="waves-effect waves-dark" href="questions"><i class="fa fa-question"></i>&nbsp;&nbsp;Security Questions</a></li>
                            <li @if($nom_page == "Subscription packs for platform Management") class="active" @endif><a class="waves-effect waves-dark" href="packabonnementplatforms"><i class="fa fa-shopping-basket"></i>&nbsp;&nbsp;Packs Platform</a></li>
                            <li @if($nom_page == "Balance Affiliate Parameters Management") class="active" @endif><a class="waves-effect waves-dark" href="balanceaffiliationparameters"><i class="fa fa-percent"></i>&nbsp;&nbsp;Balance Affiliate <br />Parameters</a></li>
                        </ul>
                    </li>
                @endif
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
<!-- ============================================================== -->
<!-- End Left Sidebar - style you can find in sidebar.scss  -->
<!-- ============================================================== -->