<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
   <meta name="csrf-token" content="{{ csrf_token() }}">
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
    <style>
        .required_field
        {
            font-weight: bold;
            color: red;
        }
    </style>
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
    var id_questions_array = [];
    var count_error_questions = 0;
    //console.log('id_questions_array = > ', id_questions_array);
</script>
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<section id="wrapper">
    <div class="login-register" style="background-image:url({{ asset('assets/images/background/login-register.jpg') }}); overflow-y:auto;">
        <div class="login-box card" style="margin-bottom: 5%;">
            <div class="card-body">
                <span id="msg_confirm_form" style="display: none;"></span>
                <form method="post" class="form-horizontal form-material" id="securityquestions">
                    <h3 class="box-title m-b-20">Security Question</h3>
                    <div class="form-group">
                        <label> Security Question <span class="required_field"> (*)</span></label>
                        <select class="form-control" name="id_question" id="id_question">
                            @foreach ($questions_array as $question_array)
                            <option value="{{ $question_array['id'] }}">{{ $question_array['question']}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label> Security Answer <span class="required_field"> (*)</span></label>
                        <input type="text" class="form-control form-control-line" name="reponse" id="reponse" placeholder="Enter your answer" required>
                    </div>
                    <div class="form-group text-center m-t-20">
                        <div class="col-xs-12">
                            <input type="hidden" id="user_id_final_security" name="user_id_final_security" value="{{ $user_id }}">
                            <input type="hidden" id="wt_64" name="wt_64" value="{{ $wt_64 }}">
                            <button class="btn btn-info btn-lg btn-block text-uppercase waves-effect waves-light" type="submit">Answer Question</button>
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
<script type="text/javascript" src="{{ asset('js/ajax/securityquestions/securityquestions.js') }}"></script>
</body>
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
