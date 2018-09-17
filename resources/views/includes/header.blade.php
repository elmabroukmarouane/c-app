<!-- ============================================================== -->
<!-- Topbar header - style you can find in pages.scss -->
<!-- ============================================================== -->
<?php $tpersonne_page_head = \App\Tpersonne::find($personne->id_tpersonne); ?>
<header class="topbar">
    <nav class="navbar top-navbar navbar-expand-md navbar-light">
        <!-- ============================================================== -->
        <!-- Logo -->
        <!-- ============================================================== -->
        <div class="navbar-header">
            <a class="navbar-brand" href="homes">
                <!-- Logo icon -->
                <b>
                    <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
                    <!-- Dark Logo icon -->
                    <img src="assets/images/logo-icon.png" alt="homepage" class="dark-logo" />
                    <!-- Light Logo icon -->
                    <img src="assets/images/logo-light-icon.png" alt="homepage" class="light-logo" style="border: 2px solid #FFFFFF; -webkit-box-shadow: 0 0 20px 5px rgba(255,255,255,0.5);box-shadow: 0 0 20px 5px rgba(255,255,255,0.5);" />
                </b>
                <!--End Logo icon -->
                <!-- Logo text -->
                <span>
                         <!-- dark Logo text -->
                         <img src="assets/images/logo-text.png" alt="homepage" class="dark-logo" />
                    <!-- Light Logo text -->
                         <img src="assets/images/logo-light-text.png" class="light-logo" alt="homepage" /></span> </a>
        </div>
        <!-- ============================================================== -->
        <!-- End Logo -->
        <!-- ============================================================== -->
        <div class="navbar-collapse">
            <!-- ============================================================== -->
            <!-- toggle and nav items -->
            <!-- ============================================================== -->
            <ul class="navbar-nav mr-auto mt-md-0">
                <!-- This is  -->
                <li class="nav-item"> <a class="nav-link nav-toggler hidden-md-up text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="mdi mdi-menu"></i></a> </li>
                <li class="nav-item"> <a class="nav-link sidebartoggler hidden-sm-down text-muted waves-effect waves-dark" href="javascript:void(0)"><i class="ti-menu"></i></a> </li>
                <!-- ============================================================== -->
                <!-- Messages -->
                <!-- ============================================================== -->
                @if($tpersonne_page_head->tpersonne == "Member")
                <li class="nav-item dropdown mega-dropdown"> <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="mdi mdi-view-grid"></i></a>
                    <div class="dropdown-menu scale-up-left">
                        <ul class="mega-dropdown-menu row">
                            <li class="col-lg-12  m-b-30">
                                {{--  <h4 class="m-b-20">RAKING</h4>  --}}
                                <label><h4 class="m-t-0 text-info text-uppercase" id="raking_user"></h4></label>
                                <!-- <div class="row col-3">
                                    <div class="col-4">
                                        <h6 class="m-b-0"><small>RAKING</small></h6>
                                    </div>
                                    <div class="col-4">
                                        <h6 class="m-b-0"><small>THIS MONTH</small></h6>
                                        <h4 class="m-t-0 text-info">$58,356</h4>
                                    </div>
                                    <div class="col-4">
                                        <h6 class="m-b-0"><small>LAST MONTH</small></h6>
                                        <h4 class="m-t-0 text-info">$48,356</h4>
                                    </div>
                                </div> -->
                            </li>
                            <!-- Begin Affiliate Link -->
                            <li class="col-lg-12  m-b-30">
                                <!--<h4 class="m-b-20">AFFILIATE LINK</h4>-->
                                <form>
                                    <div class="alert alert-info" style="display: none;" id="copy_message">
                                        <button data-dismiss="alert" class="close" type="button">×</button>
                                        <strong> Well done ! </strong> You successfully copied this link !
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-10">
                                            <input type="text" class="form-control" id="affiliate_link" placeholder="AFFILIATE LINK" value="{{ url("showAffiliate/" . $personne_info_encrypt) }}" />
                                        </div>
                                        <div class="col-2">
                                            <a id="copy_affiliate_link" href="javascript:void(0)" class="btn btn-icon btn-info tip" data-toggle="tooltip" data-placement="top" data-original-title="Copy Link"><i class="fa fa-copy"></i> </a>
                                        </div>
                                    </div>
                                </form>
                            </li>
                            <!-- End Affiliate Link -->
                            <li class="col-lg-12  m-b-30">
                                <!-- Contact -->
                                <!--
                                 <h4 class="m-b-20">CONTACT ADMINISTRATOR</h4>
                                <form method="post" id="form-send-msg-admin">
                                    <div class="form-group">
                                        <textarea class="form-control" id="msg_textarea_admin" rows="3" placeholder="Message" required></textarea>
                                    </div>
                                    <input type="hidden" class="form-control" id="id_personne_msg" value="{{ $personne->id }}" />
                                    <button type="submit" class="btn btn-info">Send</button>
                                </form> -->
                                <!-- End Contact -->
                            </li>
                        </ul>
                    </div>
                </li>
                @endif
                <!-- ============================================================== -->
                <!-- End Messages -->
                <!-- ============================================================== -->


            </ul>
            <!-- ============================================================== -->
            <!-- User profile and search -->
            <!-- ============================================================== -->
            <ul class="navbar-nav my-lg-0">
                <!-- ============================================================== -->
                <!-- Comment -->
                <!-- ============================================================== -->
                @if($tpersonne_page_head->tpersonne == "Member")
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-muted text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="fa fa-info"></i>
                        <span id="pt_rouge_notif_new" style="display:none">&nbsp;<div class="notify"> <span class="heartbit"></span> <span class="point"></span> </div></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right mailbox scale-up">
                        <ul>
                            <li>
                                <div class="drop-title">Notifications</div>
                            </li>
                            <li>
                                <div class="message-center" id="notification_header">

                                </div>
                            </li>
                            <li>
                                <a class="nav-link text-center" href="posts-home"> <strong>Check all posts</strong> <i class="fa fa-angle-right"></i> </a>
                            </li>
                        </ul>
                    </div>
                </li>
                @endif
                <!-- ============================================================== -->
                <!-- End Comment -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Profile -->
                <!-- ============================================================== -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-muted waves-effect waves-dark" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="div_image_header1"><img src="divers/images/images_admins/{{$personne->image}}" alt="{{$personne->prenom}} {{$personne->nom}}" class="profile-pic" /></a>
                    <div class="dropdown-menu dropdown-menu-right scale-up">
                        <ul class="dropdown-user">
                            <li>
                                <div class="dw-user-box">
                                    <div class="u-img" id="div_image_header2"><img src="divers/images/images_admins/{{$personne->image}}" alt="{{$personne->prenom}} {{$personne->nom}}"></div>
                                    <div class="u-text">
                                        <h4 id="div_nom_header"><a href="mailto:{{$user->email}}">{{$personne->prenom}} {{$personne->nom}}</a></h4>
                                        <p class="text-muted" id="div_email_header"></p>
                                    </div>
                                </div>
                            </li>
                            <li role="separator" class="divider"></li>
                            @if($tpersonne_page_head->tpersonne == "Member")
                            <li><a href="javascript:void(0)" ><span id="div_raking_user"></span></a></li>
                            <li role="separator" class="divider"></li>
                            @endif
                            <li><a href="profil-page"><i class="ti-user"></i> My Profile</a></li><!--   onclick="Profilmodifier({{$personne->id}})" -->
                            @if($tpersonne_page_head->tpersonne == "Member")
                            <li role="separator" class="divider"></li>
                            <li><a href="usercompanyaccounts"><i class="fa fa-bank"></i> Company Accounts</a></li><!-- class="active"  -->
                            <li><a href="usercompanywallets"><i class="ti-wallet"></i> Company Wallets</a></li><!-- class="active"  -->
                            @endif
                            <!-- <li><a href="#"><i class="ti-wallet"></i> My Balance</a></li>
                            <li><a href="#"><i class="ti-email"></i> Inbox</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#"><i class="ti-settings"></i> Account Setting</a></li> -->
                            <li role="separator" class="divider"></li>
                            <li><a href="javascript:void(0)" onclick="$('#modal-fullscreen').modal('show');"><i class="fa fa-power-off"></i> Logout</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</header>
<!-- ============================================================== -->
<!-- End Topbar header -->
<!-- ============================================================== -->