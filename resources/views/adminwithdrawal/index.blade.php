@extends('layouts.layout')
@section('content')
    <script>
        var adminwithdrawals_list = [];
    </script>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-4">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action</button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:void(0)" onclick="adminwithdrawals_list = LoadadminwithdrawalsList(); refresh_table(adminwithdrawals_list); filter_table(0); $('#filter_status_pvbalancepersonne').val(0)"><i class="fa fa-refresh"></i> Refresh Table</a>
                    </div>
                </div>
            </div>
            <div class="form-group" style="float: left;">
                <div class="form-material m-t-40">
                    <label><h4><strong>Filter by Status</strong></h4></label>
                    <select class="form-control" id="filter_status_pvbalancepersonne" name="filter_status_pvbalancepersonne" onchange="filter_table($(this).val())">
                        <option value="-1">All Withdrawal Requests</option>
                        <option value="0" selected="selected">Pending</option>
                        <option value="1">Validated</option>
                        <option value="2">Rejected</option>
                    </select>
                </div>
            </div>

            <div class="table-responsive m-t-40">
                <table id="adminwithdrawals-list" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>User</th>
                        <th>Balance</th>
                        <th>Payment Type</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Date</th>
                        <th>Update Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/adminwithdrawal/adminwithdrawal.js"></script>
@stop