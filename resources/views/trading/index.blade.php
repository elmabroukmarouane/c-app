@extends('layouts.layout')
@section('content')
    <script>
        //var affiliates_list = new Array();
    </script>
    <div class="card">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs customtab" role="tablist">
            <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#trading-packs-tab" role="tab"><span class="hidden-sm-up"><i class="fa fa-sitemap"></i></span> <span class="hidden-xs-down"><strong>Trading Package</strong></span></a> </li>
            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ontrading-list-tab" role="tab"><span class="hidden-sm-up"><i class="fa fa-list"></i></span> <span class="hidden-xs-down"><strong>Active Packages</strong></span></a> </li>
            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ontrading-history-tab" role="tab"><span class="hidden-sm-up"><i class="ti-email"></i></span> <span class="hidden-xs-down"><strong>Packages History</strong></span></a> </li>
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
                                            <p class="uppercase" id="p_uppercase">per Package</p>
                                        </div>
                                        <div class="price-table-content">
                                            <div class="price-row"><i class="fa fa-bitcoin"></i> Profit</div>
                                            <div class="price-row"><i class="fa fa-money"></i> {{ $abonnement->description_1 }}</div>
                                            <div class="price-row">{{ $abonnement->description_2 }}</div>
                                            <div class="price-row">
                                                <span class="br_tag">
                                                    <?php if($i == 1 || $i % count($abonnements) == 0){ echo '<br /><br />'; } ?>
                                                </span>
                                                <button onclick="show_trading_pack_modal({{ $personne->id }}, {{ $abonnement->id }})" class="btn <?php if($abonnement->popular == 1){ echo 'btn-lg btn-info'; }else{ echo 'btn-success'; } ?> waves-effect waves-light m-t-20" id="btn_take_it">Take it</button>
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
                <div class="row">
                    <div class="col-4">
                        <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Action
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="{{route('generatePDF_trading_active_packs')}}" target="_blank"><i class="fa fa-file-pdf-o"></i> Generate PDF</a>
                        </div>
                    </div>
                </div>
                <div class="table-responsive m-t-40">
                    <table id="ontrading-list" class="display nowrap table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>Package</th>
                            <th>Pay Type</th>
                            <th>Payment</th>
                            <th>End Date</th>
                            <th>Total</th>
                            {{--  <th>Paid</th>
                            <th>Rest</th>  --}}
                            <th>Rest Period</th>
                        </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="tab-pane p-20" id="ontrading-history-tab" role="tabpanel">
                <div class="row">
                    <div class="col-4">
                        <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Action
                        </button>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="{{route('generatePDF_trading_history_packs')}}" target="_blank"><i class="fa fa-file-pdf-o"></i> Generate PDF</a>
                        </div>
                    </div>
                </div>
                <br>
                <br>
                <table id="ontrading-list-history" class="display nowrap table table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>Package</th>
                        <th>Pay Type</th>
                        <th>Payment</th>
                        <th>End Date</th>
                        <th>Total</th>
                        {{--  <th>Paid</th>
                        <th>Rest</th>  --}}
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
    <style>
        @media screen and (max-width: 767px) {
            .pricing-body h2 {
                font-size: 56px;
                font-weight: 500;
            }
        }
        @media screen and (min-width: 768px) and (max-width: 1092px) {
            .pricing-body h2 {
                position: relative;
                font-size: 30px;
                margin: 20px 0 10px;
                font-weight: 500;
            }
        }
        @media screen and (min-width: 768px) and (max-width: 770px) {
            #p_uppercase {
                font-size: 15px;
            }
        }

        @media screen and (min-width: 768px) and (max-width: 990px) {
            #btn_take_it {
                padding: 7px 12px;
                font-size: 14px;
            }
        }

        @media screen and (min-width: 1093px) and (max-width: 1288px) {
            .pricing-body h2 {
                position: relative;
                font-size: 50px;
                margin: 20px 0 10px;
                font-weight: 500;
            }
        }
        @media screen and (min-width: 991px) {
            .br_tag {
                display: inline;
            }
        }
        @media screen and (max-width: 990px) {
            .br_tag {
                display: none;
            }
        }
    </style>
@stop