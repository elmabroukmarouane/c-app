@extends('layouts.layout')
@section('content')
    <script>
        var questreps_list = new Array();
        var questions_array = new Array();
        var questrep_array = new Array();
        var id_questions_array = new Array();
        var id_questrep_array = new Array();
    </script>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-4">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action</button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:void(0)" onclick="fill_form_questreps()"><i class="fa fa-plus"></i> Add / Update</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="javascript:void(0)" onclick="questreps_list = LoadquestrepsList(); refresh_table(questreps_list)"><i class="fa fa-refresh"></i> Refresh Table</a>
                    </div>
                </div>
            </div>

            <div class="table-responsive m-t-40">
                <table id="questreps-list" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Question</th>
                        <th style="width: 20%;">Answer</th>
                        <th style="width: 20%;">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @include('users_accounts.questreps.form')
    @include('users_accounts.questreps.form_update')
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/users_accounts/questreps/questreps.js"></script>
@stop