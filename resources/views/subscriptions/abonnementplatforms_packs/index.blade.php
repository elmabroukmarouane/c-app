@extends('layouts.layout')
@section('content')
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-4">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Action
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:void(0)" onclick="$('#finished_pack_filter').val(0); table_abonnementplatforms($('#finished_pack_filter').val());"><i class="fa fa-refresh"></i> Refresh Table</a>
                        <a class="dropdown-item" href="javascript:void(0)" onclick="supprimer_all()"><i class="fa fa-trash-o"></i> Delete selected</a>
                        {{--  <a class="dropdown-item" href="javascript:void(0)" onclick="vider_table()"><i class="fa fa-bomb"></i> Clear table</a>  --}}
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="{{route('generatePDF_abonnementplatforms_packs')}}" target="_blank"><i class="fa fa-file-pdf-o"></i> Generate PDF</a>
                    </div>
                </div>
            </div>
            <div class="form-group" style="float: left;">
                <div class="form-material m-t-40">
                    <label><h4><strong>Filter</strong></h4></label>
                    <select class="form-control" id="finished_pack_filter" name="finished_pack_filter" onchange="table_abonnementplatforms($(this).val())">
                        <option value="0">Active Packs</option>
                        <option value="1">Inactive Packs</option>
                    </select>
                </div>
            </div>
            <div class="table-responsive m-t-40">
                <table id="abonnementplatforms-abonnementplatforms-packs-list" class="display nowrap table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th><input type="checkbox" id="chk_all" onclick="checkall()"></th>
                        <th>Sponsor</th>
                        <th>Pack</th>
                        <th>Pay Type</th>
                        <th>Payment</th>
                        <th>Period</th>
                        <th>Total</th>
                        <th>Paid</th>
                        <th>Rest</th>
                        <th>Rest Period</th>
                        <th style="width: 20%;">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @include('subscriptions.abonnementplatforms_packs.abonnementplatforms_pack')
    @include('subscriptions.abonnementplatforms_packs.form_status')
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/subscriptions/abonnementplatforms_packs/abonnementplatforms-packs.js"></script>
@stop