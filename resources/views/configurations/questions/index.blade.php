@extends('layouts.layout')
@section('content')
    <script>
        var questions_list = new Array();
    </script>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-4">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Action</button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="javascript:void(0)" onclick="vider()"><i class="fa fa-plus"></i> Add</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="javascript:void(0)" onclick="questions_list = LoadquestionsList(); refresh_table(questions_list)"><i class="fa fa-refresh"></i> Refresh Table</a>
                        <a class="dropdown-item" href="javascript:void(0)" onclick="supprimer_all()"><i class="fa fa-trash-o"></i> Delete selected</a>
                        {{--  <a class="dropdown-item" href="javascript:void(0)" onclick="vider_table()"><i class="fa fa-bomb"></i> Clear table</a>  --}}
                    </div>
                </div>
            </div>

            <div class="table-responsive m-t-40">
                <table id="questions-list" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th><input type="checkbox" id="chk_all" onclick="checkall()"></th>
                        <th>Questions</th>
                        <th style="width: 20%;">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @include('configurations.questions.form')
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/configurations/questions/questions.js"></script>
@stop