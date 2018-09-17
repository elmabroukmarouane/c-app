@extends('layouts.layout')
@section('content')
    <script>
        var companyaccounts_list = new Array();
    </script>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-4">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action</button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:void(0)" onclick="companyaccounts_list = LoadcompanyaccountsList(); refresh_table(companyaccounts_list)"><i class="fa fa-refresh"></i> Refresh Table</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="{{route('generatePDF_companyaccounts')}}" target="_blank"><i class="fa fa-file-pdf-o"></i> Generate PDF</a>
                    </div>
                </div>
            </div>

            <div class="table-responsive m-t-40">
                <table id="companyaccounts-list" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Bank</th>
                        <th>Bank Country</th>
                        <th>#Account</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @include('home.companyaccounts.form_show')
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/home/companyaccounts/companyaccounts.js"></script>
@stop