{{--  @if(app('request')->input('wrong') == md5("wrong_security_question"))
<script>
    $( document ).ready(function() {
        $.ajax({
            url: "deconnectSecurityQuestions",
            type: "GET",
            async: false,
            success: function(response) {
                window.location.href = data.url;
            }
        });
    });
</script>
@endif  --}}
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicon.png">
    <title>. : - Trad Management || {{$nom_page}} - : .</title>
    <!-- Bootstrap Core CSS -->
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
    <!-- You can change the theme colors from here -->
    <link href="css/colors/blue.css" id="theme" rel="stylesheet">
    <!-- Date picker plugins css -->
    <link href="assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/jquery-confirm.min.css"/>
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

<body class="fix-header card-no-border">
<!-- ============================================================== -->
<!-- Preloader - style you can find in spinners.css -->
<!-- ============================================================== -->
<div class="preloader">
    <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10" /> </svg>
</div>
<!-- ============================================================== -->
<!-- Main wrapper - style you can find in pages.scss -->
<!-- ============================================================== -->
<div id="main-wrapper">
    @include('includes.header')
    @include('includes.menu')
    <!-- ============================================================== -->
    <!-- Page wrapper  -->
    <!-- ============================================================== -->
    <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
            @include('includes.header_page')
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
            <div class="row">
                <div class="col-12">
                    @yield('content')
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End PAge Content -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        @include('includes.footer')
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Page wrapper  -->
    <!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->
<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->
<script src="assets/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script src="assets/plugins/bootstrap/js/popper.min.js"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- slimscrollbar scrollbar JavaScript -->
<script src="js/jquery.slimscroll.js"></script>
<!--Wave Effects -->
<script src="js/waves.js"></script>
<!-- CKEditor -->
<script src="js/ckeditor/ckeditor.js"></script>
<!--Menu sidebar -->
<script src="js/sidebarmenu.js"></script>
<!--stickey kit -->
<script src="assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
<script src="assets/plugins/sparkline/jquery.sparkline.min.js"></script>
<!--Custom JavaScript -->
<script src="js/custom.min.js"></script>
<script src="js/validation.js"></script>
<!-- This is data table -->
<script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
<!-- start - This is for export functionality only -->
<script src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.flash.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.print.min.js"></script>
<!-- end - This is for export functionality only -->
<!-- Date Picker Plugin JavaScript -->
<script src="assets/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="assets/plugins/select2/dist/js/select2.full.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-select/bootstrap-select.min.js" type="text/javascript"></script>
<script src="js/jasny-bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-confirm.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="js/ajax/profil/profil.js"></script>
<script>
    //$(".select2").select2();
    //CKEDITOR.replace('msg_textarea_admin');
    $('.mydatepicker').datepicker({
        format: "dd/mm/yyyy",
        autoclose: true,
        todayHighlight: true,
        weekStart: 1
    });
</script>
@yield('scripts')
<!-- ============================================================== -->
<!-- Style switcher -->
<!-- ============================================================== -->
<script src="assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
<script type="text/javascript" src="https://momentjs.com/downloads/moment.js"></script>
<script type="text/javascript" src="https://momentjs.com/downloads/moment-with-locales.js"></script>
@if($nom_page != "Update Profil")
@include('profil.form')
@endif
@include('subscriptionpacks.add_package')
@include('includes.modal_logout')
</body>

</html>
