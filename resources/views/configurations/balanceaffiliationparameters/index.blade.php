@extends('layouts.layout')
@section('content')
    <script>
        var balanceaffiliationparameters_list = [];
    </script>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-4">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action</button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:void(0)" onclick="balanceaffiliationparameters_list = LoadbalanceaffiliationparametersList(); refresh_table(balanceaffiliationparameters_list)"><i class="fa fa-refresh"></i> Refresh Table</a>
                    </div>
                </div>
            </div>

            <div class="table-responsive m-t-40">
                <table id="balanceaffiliationparameters-list" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>New Comer Parameter</th>
                        <th>Affiliate Parameter</th>
                        <th style="width: 20%;">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @include('configurations.balanceaffiliationparameters.form')
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/configurations/balanceaffiliationparameters/balanceaffiliationparameters.js"></script>
@stop