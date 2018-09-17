@extends('layouts.layout')
@section('content')
    <script>
        var supporttickets_list = new Array();
    </script>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-4">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action</button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:void(0)" onclick="vider()"><i class="fa fa-plus"></i> Open Ticket</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="javascript:void(0)" onclick="supporttickets_list = LoadsupportticketsList(); refresh_table(supporttickets_list)"><i class="fa fa-refresh"></i> Refresh Table</a>
                    </div>
                </div>
            </div>
            <div class="form-group" style="float: left;">
                <div class="form-material m-t-40">
                    <label><h4><strong>Filter</strong></h4></label>
                    <select class="form-control" id="supporttickets_status_filter" name="supporttickets_status_filter" onchange="filter_table($(this).val())">
                        <option value="-1">All Tickets</option>
                        <option value="0">Open Tickets</option>
                        <option value="1" style="text-transform: capitalize;">Closed Tickets</option>
                    </select>
                </div>
            </div>
            <div class="table-responsive m-t-40">
                <table id="supporttickets-list" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <!-- <th width="10%"><input type="checkbox" id="chk_all" onclick="checkall()"></th> -->
                        <th width="10%">Ticket No.</th>
                        <th width="20%">User</th>
                        <th width="20%">Subject</th>
                        <th width="20%">Date</th>
                        <th width="10%">Status</th>
                        <th style="width: 20%;">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @include('supporttickets.users.form')
@stop
@section('scripts')
    <script>
        CKEDITOR.replace('supportticket_message');
    </script>
    <script type="text/javascript" src="js/ajax/supporttickets/users/supporttickets.js"></script>
@stop