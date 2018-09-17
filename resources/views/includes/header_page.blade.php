<!-- ============================================================== -->
<!-- Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->
<div class="row page-titles">
    <div class="col-md-8 col-8 align-self-center">
        <h3 class="text-themecolor m-b-0 m-t-0">{{$nom_page}}</h3>
        <ol class="breadcrumb">
            <li class="breadcrumb-item @if($nom_page == "Home") active @endif"><a href="home">Home</a></li>
            @if($nom_page != "Home")
            <li class="breadcrumb-item active">{{$nom_page}}</li>
            @endif
        </ol>
    </div>
</div>
<!-- ============================================================== -->
<!-- End Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->