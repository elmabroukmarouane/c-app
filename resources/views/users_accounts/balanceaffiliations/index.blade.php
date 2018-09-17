@extends('layouts.layout')
@section('content')
    <script>
        var balanceaffiliations_list = new Array();
    </script>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-4">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action</button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:void(0)" onclick="modifierByRanking()"><i class="fa fa-edit"></i> Update Balance by Ranking</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="javascript:void(0)" onclick="balanceaffiliations_list = LoadbalanceaffiliationsList(); refresh_table(balanceaffiliations_list)"><i class="fa fa-refresh"></i> Refresh Table</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="{{route('generatePDF_balanceaffiliations')}}" target="_blank"><i class="fa fa-file-pdf-o"></i> Generate PDF</a>
                    </div>
                </div>
            </div>
            <div class="form-group" style="float: left;">
                <div class="form-material m-t-40">
                    <label><h4><strong>Filter by Ranking</strong></h4></label>
                    <select class="form-control" id="id_rank_sponsor" name="id_rank_sponsor" onchange="filter_table($(this).val())">
                        <option value="-1">All users</option>
                        @foreach ($rakings as $raking)
                        <option value="{{ $raking->id }}">{{ $raking->ranking }}</option>
                        @endforeach
                    </select>
                </div>
            </div>

            <div class="table-responsive m-t-40">
                <table id="balanceaffiliations-list" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>User</th>
                        <th>Rank</th>
                        <th>Balance</th>
                        <th style="width: 20%;">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @include('users_accounts.balanceaffiliations.form')
    @include('users_accounts.balanceaffiliations.form_ranking')
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/users_accounts/balanceaffiliations/balanceaffiliations.js"></script>
@stop