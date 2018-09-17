@extends('layouts.layout')
@section('content')
    <script>
        var companywallets_list = new Array();
    </script>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-4">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action</button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:void(0)" onclick="companywallets_list = LoadcompanywalletsList(); refresh_table(companywallets_list)"><i class="fa fa-refresh"></i> Refresh Table</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="{{route('generatePDF_companywallets')}}" target="_blank"><i class="fa fa-file-pdf-o"></i> Generate PDF</a>
                    </div>
                </div>
            </div>

            <div class="table-responsive m-t-40">
                <table id="companywallets-list" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Currencie</th>
                        <th>Wallet Name</th>
                        <th>Wallet Address</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @include('home.companywallets.form_show')
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/home/companywallets/companywallets.js"></script>
@stop