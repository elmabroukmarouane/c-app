@extends('layouts.layout')
@section('content')
    <script>
        var withdrawals_list = [];
    </script>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-4">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action</button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:void(0)" onclick="withdraw_amount_balance()"><i class="fa fa-credit-card"></i> Withdraw Balance</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="javascript:void(0)" onclick="withdrawals_list = LoadwithdrawalsList(); refresh_table(withdrawals_list)"><i class="fa fa-refresh"></i> Refresh Table</a>
                    </div>
                </div>
            </div>
            <div class="form-group" style="float: left;">
                <div class="form-material m-t-40">
                    <label><h4><strong>Filter by Status</strong></h4></label>
                    <select class="form-control" id="filter_status_pvbalancepersonne" name="filter_status_pvbalancepersonne" onchange="filter_table($(this).val())">
                        <option value="-1" selected="selected">All withdrawals</option>
                        <option value="0">Pending</option>
                        <option value="1">Validated</option>
                        <option value="2">Rejected</option>
                    </select>
                </div>
            </div>

            <div class="table-responsive m-t-40">
                <table id="withdrawals-list" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>You</th>
                        {{-- <th>Balance</th> --}}
                        <th>Payment Type</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Date</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @include('withdrawal.form')
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/withdrawal/withdrawal.js"></script>
@stop