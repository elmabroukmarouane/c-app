@extends('layouts.layout')
@section('content')
    <script>
        var admins_list = new Array();
    </script>
    <div class="card">
        <div class="card-body">
            <!--<h4 class="card-title">Data Export</h4>
            <h6 class="card-subtitle">Export data to Copy, CSV, Excel, PDF & Print</h6>
            <div class="col-4">
                <a href="javascript:void(0)" class="btn waves-effect waves-light btn-block btn-outline-info" onclick="vider()"><i class="fa fa-plus"></i></a>
            </div>-->
            <div class="row">
                <div class="col-4">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Action
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:void(0)" onclick="vider()"><i class="fa fa-plus"></i> Add</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="javascript:void(0)" onclick="admins_list = LoadAdminsList(); refresh_table(admins_list)"><i class="fa fa-refresh"></i> Refresh Table</a>
                        <a class="dropdown-item" href="javascript:void(0)" onclick="supprimer_all()"><i class="fa fa-trash-o"></i> Delete selected</a>
                        {{--  <a class="dropdown-item" href="javascript:void(0)" onclick="vider_table()"><i class="fa fa-bomb"></i> Clear table</a>  --}}
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="{{route('generatePDF')}}" target="_blank"><i class="fa fa-file-pdf-o"></i> Generate PDF</a>
                    </div>
                </div>
            </div>
            <div class="form-group" style="float: left;">
                <div class="form-material m-t-40">
                    <label><h4><strong>Filter</strong></h4></label>
                    <select class="form-control" id="id_tpersonne_filter" name="id_tpersonne_filter" onchange="filter_table($(this).val(), $('#id_statuscompte_filter').val())">
                        <option value="-1">All type of users</option>
                        @foreach($tpersonnes as $tpersonne)
                            <option value="{{ $tpersonne->id }}" style="text-transform: capitalize;">{{ $tpersonne->tpersonne }}</option>
                        @endforeach
                    </select>
                    <br />
                    <br />
                    <select class="form-control" id="id_statuscompte_filter" name="id_statuscompte_filter" onchange="filter_table($('#id_tpersonne_filter').val(), $(this).val())">
                        <option value="-1">All type of users status</option>
                        @foreach($statuscomptes as $statuscompte)
                            <option style="text-transform: capitalize;" value="{{ $statuscompte->id }}">{{ $statuscompte->status_compte }}</option>
                        @endforeach
                    </select>
                </div>
            </div>

            <div class="table-responsive m-t-40">
                <table id="admins-list" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th><input type="checkbox" id="chk_all" onclick="checkall()"></th>
                        <th>First & Lastname</th>
                        <th>Birthdate</th>
                        <th>Phone</th>
                        <th>Email</th>
                        {{-- <th>Image</th> --}}
                        <th style="width: 20%;">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @include('users.form')
    @include('users.form_status')
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/users/admins/admins.js"></script>
@stop