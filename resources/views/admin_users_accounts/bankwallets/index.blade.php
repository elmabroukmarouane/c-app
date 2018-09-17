@extends('layouts.layout')
@section('content')
    <script>
        var bankwallets_list = new Array();
    </script>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <table id="bankwallets-list" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
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
    @include('admin_users_accounts.bankwallets.wallets_list')
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/admin_users_accounts/bankwallets/bankwallets.js"></script>
@stop