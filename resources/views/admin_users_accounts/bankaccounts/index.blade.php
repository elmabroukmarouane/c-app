@extends('layouts.layout')
@section('content')
    <script>
        var bankaccounts_list = new Array();
    </script>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <table id="bankaccounts-list" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>User</th>
                        <th style="width: 20%;">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @include('admin_users_accounts.bankaccounts.accounts_list')
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/admin_users_accounts/bankaccounts/bankaccounts.js"></script>
@stop