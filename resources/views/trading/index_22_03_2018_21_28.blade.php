@extends('layouts.layout')
@section('content')
    <script>
        //var affiliates_list = new Array();
    </script>
    <div class="card">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs customtab" role="tablist">
            <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#trading-packs-tab" role="tab"><span class="hidden-sm-up"><i class="fa fa-sitemap"></i></span> <span class="hidden-xs-down"><strong>Trading Package</strong></span></a> </li>
            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ontrading-list-tab" role="tab"><span class="hidden-sm-up"><i class="fa fa-list"></i></span> <span class="hidden-xs-down"><strong>On Trading</strong></span></a> </li>
            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ontrading-history-tab" role="tab"><span class="hidden-sm-up"><i class="ti-email"></i></span> <span class="hidden-xs-down"><strong>On Trading History</strong></span></a> </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="trading-packs-tab" role="tabpanel">
                <div class="card-body">
                    <div class="row pricing-plan">
                        <?php $i = 1; ?>
                        @foreach($abonnements as $abonnement)
                            <div class="col-md-<?php if($i == 1 || $i % count($abonnements) == 0){ echo '3'; }else{ echo '2'; } ?> col-xs-12 col-sm-6 no-padding">
                                <div class="pricing-box <?php if($abonnement->popular == 1){ echo 'featured-plan'; }else{ echo 'b-l'; } ?>">
                                    <div class="pricing-body">
                                        <div class="pricing-header">
                                            <?php if($abonnement->popular == 1){ echo '<h4 class="price-lable text-white bg-warning"> Popular</h4>'; } ?>
                                            <h4 class="text-center">{{ $abonnement->titre }}</h4>
                                            <h2 class="text-center"><span class="price-sign">$</span>{{ intval($abonnement->prix) }}</h2>
                                            <p class="uppercase">per pack</p>
                                        </div>
                                        <div class="price-table-content">
                                            <div class="price-row"><i class="fa fa-bitcoin"></i> Profit</div>
                                            <div class="price-row"><i class="fa fa-money"></i> {{ $abonnement->description_1 }}</div>
                                            <div class="price-row">{{ $abonnement->description_2 }}</div>
                                            <div class="price-row">
                                                <?php if($i == 1 || $i % count($abonnements) == 0){ echo '<br /><br />'; } ?>
                                                <button onclick="show_trading_pack_modal({{ $personne->id }}, {{ $abonnement->id }})" class="btn <?php if($abonnement->popular == 1){ echo 'btn-lg btn-info'; }else{ echo 'btn-success'; } ?> waves-effect waves-light m-t-20">Take it</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <?php $i++; ?>
                        @endforeach
                    </div>
                </div>
            </div>
            <div class="tab-pane p-20" id="ontrading-list-tab" role="tabpanel">
                <div class="table-responsive m-t-40">
                    <table id="ontrading-list" class="display nowrap table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>Pack</th>
                            <th>Pay Type</th>
                            <th>Payment</th>
                            <th>Period</th>
                            <th>Total</th>
                            <th>Paid</th>
                            <th>Rest</th>
                            <th>Rest Period</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="tab-pane p-20" id="ontrading-history-tab" role="tabpanel">
                <table id="ontrading-list-history" class="display nowrap table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Pack</th>
                        <th>Pay Type</th>
                        <th>Payment</th>
                        <th>Period</th>
                        <th>Total</th>
                        <th>Paid</th>
                        <th>Rest</th>
                        <!-- <th>Rest Period</th> -->
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @include('trading.add_package')
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/trading/trading.js"></script>
    <script>
        $(document).ready(function() {
            table_ontrading({{ $personne->id }});
            table_ontrading_history({{ $personne->id }});
        });
    </script>
@stop