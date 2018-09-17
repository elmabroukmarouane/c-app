@extends('layouts.layout')
@section('content')
    <script>
        //var affiliates_list = new Array();
    </script>
    <div class="card">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs customtab" role="tablist">
            <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#subscriptionpacks-list-tab" role="tab"><span class="hidden-sm-up"><i class="fa fa-list"></i></span> <span class="hidden-xs-down"><strong>Active Package</strong></span></a> </li>
            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#subscriptionpacks-history-tab" role="tab"><span class="hidden-sm-up"><i class="ti-email"></i></span> <span class="hidden-xs-down"><strong>Packages History</strong></span></a> </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active p-20" id="subscriptionpacks-list-tab" role="tabpanel">
                <div class="table-responsive m-t-40">
                    <table id="subscriptionpacks-list" class="display nowrap table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>Package</th>
                            <th>Pay Type</th>
                            {{-- <th>Payment</th> --}}
                            <th>End Date</th>
                            <th>Total</th>
                            {{-- <th>Paid</th>
                            <th>Rest</th> --}}
                            <th>Rest Period</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="tab-pane p-20" id="subscriptionpacks-history-tab" role="tabpanel">
                <div class="table-responsive m-t-40">
                    <table id="subscriptionpacks-list-history" class="display nowrap table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>Package</th>
                            <th>Pay Type</th>
                            {{-- <th>Payment</th> --}}
                            <th>End Date</th>
                            <th>Total</th>
                            {{-- <th>Paid</th>
                            <th>Rest</th>
                            <th>Rest Period</th> --}}
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/subscriptionpacks/subscriptionpacks.js"></script>
    <script>
        $(document).ready(function() {
            table_subscriptionpacks({{ $personne->id }});
            table_subscriptionpacks_history({{ $personne->id }});
        });
    </script>
@stop