@extends('layouts.layout')
@section('content')
    <script>
        var affiliates_list = new Array();
    </script>
    <div class="card">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs customtab" role="tablist">
            <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#dsponsored" role="tab"><span class="hidden-sm-up"><i class="fa fa-sitemap"></i></span> <span class="hidden-xs-down">Directly sponsorised</span></a> </li>
            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#lassociets" role="tab"><span class="hidden-sm-up"><i class="fa fa-list"></i></span> <span class="hidden-xs-down">Leading associates</span></a> </li>
            <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#ranking" role="tab"><span class="hidden-sm-up"><i class="fa fa-link"></i></span> <span class="hidden-xs-down">Affiliate Link</span></a> </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane active" id="dsponsored" role="tabpanel">
                <div class="p-20">
                    <a id="download-tree-aff" href="javascript:void(0)" class="btn waves-effect waves-light btn-success">Download Graph</a>
                    <div class="col-12" id="tree-simple" style="height: 300px;"> </div>
                </div>
            </div>
            <div class="tab-pane p-20" id="lassociets" role="tabpanel">
                <div class="table-responsive m-t-40">
                    <table id="affiliates-list" class="display nowrap table table-striped table-bordered" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Name</th>
                                <th>Ranking</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Registration date</th>
                                <th>Trading Packages</th>
                                <th>Subscription Packages</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="tab-pane p-20" id="ranking" role="tabpanel">
                <!-- <h4 class="m-b-20">AFFILIATE LINK</h4> -->
                <form>
                    <div class="alert alert-info" style="display: none;" id="copy_message">
                        <button data-dismiss="alert" class="close" type="button">×</button>
                        <strong> Well done ! </strong> You successfully copied this link !
                    </div>
                    <div class="form-group row">
                        <div class="col-10">
                            <input type="text" class="form-control" id="affiliate_link" placeholder="AFFILIATE LINK" value="{{ url("showAffiliate/" . $personne_info_encrypt) }}" />
                        </div>
                        <div class="col-2">
                            <a id="copy_affiliate_link" href="javascript:void(0)" class="btn btn-icon btn-info tip" data-toggle="tooltip" data-placement="top" data-original-title="Copy Link"><i class="fa fa-copy"></i> </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    @include('networks.affiliates')
    @include('networks.ontradings')
@stop
@section('scripts')
    <link href="https://fperucic.github.io/treant-js/Treant.css" rel="stylesheet">
    <style>
        #sub-affiliates-list a
        {
            color: #002a80;
        }
        .node-treant-box
        {
            color: #0d6aad;
            font-weight: bold;
            /*padding-left: 1%;
            padding-right: 1%;
            border: solid 2px #00a300;
            background-color: #8e0096;*/
        }
        .node-treant-box:hover
        {
            cursor: pointer;
            color: #8e0096;
        }
    </style>
    <script type="text/javascript" src="https://fperucic.github.io/treant-js/Treant.js"></script>
    <script type="text/javascript" src="https://fperucic.github.io/treant-js/vendor/raphael.js"></script>
    <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
    <script type="text/javascript" src="js/ajax/networks/networks.js"></script>
    <script>
        var my_chart = new Treant(<?php echo json_encode($result_graph); ?>, null, $);
    </script>
@stop