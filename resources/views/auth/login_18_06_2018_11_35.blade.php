<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="csrf-token" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset('assets/images/favicon.png') }}">
    <title>. : - Trad Management - : .</title>
    <!-- Bootstrap Core CSS -->
    <link href="{{ asset('assets/plugins/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="{{ asset('css/colors/blue.css') }}" id="theme" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="{{ asset('css/jquery-confirm.min.css') }}"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesnt work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader">
    <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
</div>
<script>
    var var_dump_value = '';
    var id_questions_array = [];
    var email_user = '';
</script>
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<section id="wrapper">
    <div class="login-register" style="background-image:url({{ asset('assets/images/background/login-register.jpg') }}); overflow-y:auto;">
        <div class="login-box card" style="margin-bottom: 5%;">
            <div class="card-body">
                <form action="{{ route('login') }}" method="post" class="form-horizontal form-material" id="loginform">
                    {{ csrf_field() }}
                    <h3 class="box-title m-b-20">Sign In</h3>
                    @if (count($errors) > 0)
                        @foreach ($errors->all() as $error)
                            <div class="alert alert-danger block-inner" id="error_login">
                                <strong>Attention !</strong> {!! $error !!}
                            </div>
                        @endforeach
                    @endif
                    <span id="msg_confirm_form" style="display: none;"></span>
                    @if(app('request')->input('recover_password_test') == md5("yes_true"))
                        <div class="alert alert-success block-inner"><strong>Success ! </strong>Your password has been changed successfully. Please check you email and don't forget to change it when you login !</div>
                    @elseif(app('request')->input('recover_password_test') == md5("no_error"))
                        <div class="alert alert-danger block-inner"><strong>Error ! </strong>An error occured. Please Try again !</div>
                    @elseif(app('request')->input('recover_password_test') == md5("no_email"))
                        <div class="alert alert-danger block-inner"><strong>Error ! </strong>Email not found. Please Try again !</div>
                    @endif
                    @if(app('request')->input('confirm_compte_test') == md5("yes_true"))
                        <div class="alert alert-success block-inner"><strong>Success ! </strong>Your account has been successfully validated. Your can login now !</div>
                    @elseif(app('request')->input('confirm_compte_test') == md5("no_error"))
                        <div class="alert alert-danger block-inner"><strong>Error ! </strong>An error occured. Please Try again !</div>
                    @elseif(app('request')->input('confirm_compte_test') == md5("no_email"))
                        <div class="alert alert-danger block-inner"><strong>Error ! </strong>Account not found. Please Try again !</div>
                    @endif
                    @if(app('request')->input('reactivate_account_test') == md5("yes_true_reactivate_account"))
                        <div class="alert alert-success block-inner"><strong>Success ! </strong>Your account has been successfully activated. Your can login now !</div>
                    @elseif(app('request')->input('reactivate_account_test') == md5("no_error_reactivate_account"))
                        <div class="alert alert-danger block-inner"><strong>Error ! </strong>An error occured. Please Try again !</div>
                    @elseif(app('request')->input('reactivate_account_test') == md5("no_email_reactivate_account"))
                        <div class="alert alert-danger block-inner"><strong>Error ! </strong>Account not found. Please Try again !</div>
                    @endif
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" id="email" name="email" type="email" required="" placeholder="Email"> </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <input class="form-control" name="password" type="password" type="password" required="" placeholder="Password"> </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12 login-form-text-center">
                            <div class="checkbox checkbox-primary login-form-pull-left p-t-0">
                                <input id="checkbox-signin" type="checkbox">
                                <label for="checkbox-signin"> Remember me </label>
                            </div> <a href="javascript:void(0)" id="recover-btn" class="text-dark login-form-pull-right"><i class="fa fa-lock m-r-5"></i> Forgot pwd?</a> </div>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Log In</button>
                        </div>
                    </div>
                    <div class="form-group m-b-0">
                        <div class="col-sm-12 text-center">
                            <p>Don't have an account? <a href="javascript:void(0)" class="text-info m-l-5" id="link-register"><b>Sign Up</b></a></p>
                        </div>
                    </div>
                </form>
                <form class="form-horizontal" id="recoverform" method="post">
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <h3>Recover Password</h3>
                            <p class="text-muted">Enter your Email and instructions will be sent to you! </p>
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" type="email" id="recover_email" name="recover_email" required="" placeholder="Email"> </div>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-success btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Reset</button>
                            <a class="btn btn-danger btn-lg btn-block text-uppercase waves-effect waves-light" id="return-btn" style="color: #FFFFFF;">Return</a>
                        </div>
                    </div>
                </form>
                <form class="form-horizontal form-material" id="registerform" style="display: none;">
                    <h3 class="box-title m-b-20">Sign Up</h3>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" id="signup_nom" name="signup_nom" type="text" required="" placeholder="LastName">
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" id="signup_prenom" name="signup_prenom" type="text" required="" placeholder="FirstName">
                        </div>
                    </div>
                    @include('auth.country')
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" id="signup_ville" name="signup_ville" type="text" required="" placeholder="City">
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" id="signup_zipcode" name="signup_zipcode" type="text" required="" placeholder="Postcode">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <select class="form-control" name="signup_type_payment" id="signup_type_payment" onchange="show_wallet_name_select($(this).find(':selected').val())">
                                <option value="Bank" selected="selected">Bank</option>
                                <option value="Wallet">Wallet</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" id="signup_wallet_public_key" name="signup_wallet_public_key" type="text" required="" placeholder="Account Number">
                        </div>
                    </div>
                    <div id="div_signup_payment_name" class="form-group" style="display:none;">
                        <div class="col-xs-12">
                            <input class="form-control" id="signup_payment_name" name="signup_payment_name" type="text" placeholder="Wallet Name">
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" id="signup_email" name="signup_email" type="email" required="" placeholder="Email">
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <input class="form-control" id="signup_password" name="signup_password" type="password" required="" placeholder="Password">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <input class="form-control" id="signup_confirm_password" name="signup_confirm_password" type="password" required="" placeholder="Confirm Password">
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <div class="captcha">
                                <span>{!! captcha_img() !!}</span>
                                <button type="button" class="btn btn-info btn-refresh-captcha">Another Captcha</button>
                            </div>
                            <input class="form-control" id="captcha" name="captcha" type="text" required="" placeholder="Enter Captcha">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <div class="checkbox checkbox-success p-t-0 p-l-10">
                                <input id="checkbox-signup" required="" type="checkbox">
                                <label for="checkbox-signup"> I agree to all <a href="#">Terms</a></label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <input type="hidden" id="affiliate_id" name="affiliate_id" @if(isset($affiliate_id) && !empty($affiliate_id)) value="{{ $affiliate_id }}" @endif />
                            <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Sign Up</button>
                        </div>
                    </div>
                    <div class="form-group m-b-0">
                        <div class="col-sm-12 text-center">
                            <p>Already have an account? <a href="javascript:void(0)" class="text-info m-l-5" id="login-btn"><b>Sign In</b></a></p>
                        </div>
                    </div>
                </form>
                <form class="form-horizontal" id="securityquestionsform" method="post" style="display: none;">
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <h3>Security Questions</h3>
                            <p class="text-muted login-form-font-size">Enter your answers to validate ! </p>
                        </div>
                    </div>
                    <div class="form-group ">
                        <div class="col-xs-12">
                            <span id="questreps_items"></span>
                        </div>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <button class="btn btn-success btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Validate</button>
                            <a class="btn btn-danger btn-lg btn-block text-uppercase waves-effect waves-light" id="security-return-btn" style="color: #FFFFFF;">Return</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</section>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="{{ asset('js/app.js') }}"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="{{ asset('assets/plugins/bootstrap/js/popper.min.js') }}"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="{{ asset('js/jquery.slimscroll.js') }}"></script>
<!--Wave Effects -->
<script src="{{ asset('js/waves.js') }}"></script>
<!--Menu sidebar -->
<script src="{{ asset('js/sidebarmenu.js') }}"></script>
<!--stickey kit -->
<script src="{{ asset('assets/plugins/sticky-kit-master/dist/sticky-kit.min.js') }}"></script>
<script src="{{ asset('assets/plugins/sparkline/jquery.sparkline.min.js') }}"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!--Custom JavaScript -->
<script src="{{ asset('js/custom.min.js') }}"></script>
<!-- ============================================================== -->
<!-- Style switcher -->
<!-- ============================================================== -->
<script src="{{ asset('assets/plugins/styleswitcher/jQuery.style.switcher.js') }}"></script>
<script type="text/javascript" src="{{ asset('js/jquery-confirm.min.js') }}"></script>
<script type="text/javascript" src="{{ asset('js/ajax/login/login.js') }}"></script>
</body>
@if(isset($affiliate_id) && !empty($affiliate_id))
    <script>
        $(document).ready(function() {
            $('#loginform').hide();
            $('#registerform').show();
        });
    </script>
@endif
<style>
    @media (max-width: 450px) {
        .login-form-text-center {
            text-align: center !important;
        }
    }

    @media (min-width: 451px) {
        .login-form-pull-left {
            float: left;
        }
        .login-form-pull-right {
            float: right;
        }
    }
    @media (max-width: 320px) {
        .login-form-font-size {
            font-size: smaller;
        }
    }
</style>
</html>
