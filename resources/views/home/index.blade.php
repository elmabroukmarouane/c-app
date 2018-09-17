@extends('layouts.dashboard')
@section('content')
    <?php
    $tpersonne_page_head = \App\Tpersonne::find($personne->id_tpersonne);
    if($tpersonne_page_head->tpersonne == "Member" && $personne->id_statuscompte == 1)
    {
    ?>
    <!-- Row -->
    <div class="row">
        <!-- Column -->
        <div class="col-lg-4 col-md-4">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex flex-row">
                        <div class="round round-lg align-self-center round-success"><i class="fa fa-credit-card-alt"></i></div>
                        <div class="m-l-10 align-self-center">
                            <h3 class="m-b-0 font-lgiht"><i class="fa fa-dollar"></i> @if(isset($balanceaffiliation) && !empty($balanceaffiliation) && $balanceaffiliation->balance_affiliation > 0) {{ $balanceaffiliation->balance_affiliation }} @else 0 @endif</h3>
                            <h5 class="text-muted m-b-0">Balance <i class="fa fa-dollar"></i></h5></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Column -->
        <!-- Column -->
        <div class="col-lg-4 col-md-4">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex flex-row">
                        <div class="round round-lg align-self-center round-danger"><i class="fa fa-credit-card-alt"></i></div>
                        <div class="m-l-10 align-self-center">
                            <h3 class="m-b-0 font-lgiht"><i class="fa fa-bitcoin"></i> @if(isset($balancebitcoin) && !empty($balancebitcoin) && $balancebitcoin->balance_bitcoin > 0) {{ $balancebitcoin->balance_bitcoin }} @else 0 @endif</h3>
                            <h5 class="text-muted m-b-0">Balance <i class="fa fa-bitcoin"></i></h5></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Column -->
        <!-- Column -->
        <div class="col-lg-4 col-md-4">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex flex-row">
                        <div class="round round-lg align-self-center round-{{ ($rest_periode_days_abonnement > 30) ? 'info' : 'danger' }}"><i class="fa fa-shopping-basket"></i></div>
                        <div class="m-l-10 align-self-center">
                            <h3 class="m-b-0 font-lgiht">@if(isset($rest_periode_days_abonnement) && !empty($rest_periode_days_abonnement) && $rest_periode_days_abonnement > 0) {{ $rest_periode_days_abonnement }} @else Not yet ! @endif</h3>
                            <h5 class="text-muted m-b-0">Rest Subscription</h5></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Column -->
    </div>
    <!-- Row -->
    <?php } ?>
    <?php
    $tpersonne_page_head = \App\Tpersonne::find($personne->id_tpersonne);
    if(($tpersonne_page_head->tpersonne == "Admin" || $tpersonne_page_head->tpersonne == "Super Admin") && $personne->id_statuscompte == 1)
    {
    ?>
    <!-- Row -->
    <div class="row">
        <!-- Column -->
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Lastest Withrawal Requests</h4>
                    <div class="table-responsive m-t-20">
                        <table class="table stylish-table" id="admin_withdrawal_data_home">
                            <thead>
                            <tr>
                                <th>&nbsp;</th>
                                <th>User</th>
                                <th>Payment Type</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Date</th>
                                <th>Update Status</th>
                            </tr>
                            </thead>
                            <tbody>
                            @if(count($withdrawals) > 0)
                                @foreach ($withdrawals as $row)
                                    <tr>
                                        <td><span class="round round-danger"><i class="fa fa-exclamation"></i></span></td>
                                        <td><strong>{{ $row['nom'] }} {{ $row['prenom'] }}</strong></td>
                                        <td><strong>{{ $row['type_payment'] }}</strong></td>
                                        <td><strong>$ {{ $row['montant_pvbalancepersonne'] }}</strong></td>
                                        <td><label><strong><span class="label label-warning">Pending</span></strong></label></td>
                                        <td><strong>{{ $row['updated_at']->format('d/m/Y H:i:s') }}</strong></td>
                                        <td>
                                            <select class="form-control" name="home_status_pvbalancepersonne" id="home_status_pvbalancepersonne" onchange="change_status_pvbalancepersonne({{ $row['id'] }}, $(this).val())" style="padding: 2px;">
                                                <option value="0" selected="selected">Pending</option>
                                                <option value="1">Validated</option>
                                                <option value="2">Rejected</option>
                                            </select>
                                        </td>
                                    </tr>
                                @endforeach
                            @else
                                <tr>
                                    <td><span class="round round-success"><i class="fa fa-thumbs-o-up"></i></span></td>
                                    <td colspan="6" class="text-center"><strong>No withdrawal for today !</strong></td>
                                </tr>
                            @endif
                            </tbody>
                        </table>
                    </div>
                </div>
                <div><hr></div>
                <div class="card-body" style="padding-top: 0">
                        <div style="text-align: right">
                            {{-- <a href="javascript:void(0)">All Withrawal Requests</a> --}}
                            <a href="adminwithdrawal" class="btn btn-outline-info waves-effect waves-light"><span class="btn-label"><i class="fa fa-list"></i></span>All Withrawal Requests</a>
                        </div>
                </div>
            </div>
        </div>
        <!-- Column -->
    </div>
    <!-- Row -->
    <?php } ?>
    <!-- Row -->
    <div class="row">
        <!-- Column -->
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Blockchain Presentation</h4>
                    <br />
                    <div class="embed-responsive embed-responsive-16by9">
                        <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/6WG7D47tGb0" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
        </div>
        <!-- Column -->
    </div>
    <!-- Row -->
    <?php
    $tpersonne_page_head = \App\Tpersonne::find($personne->id_tpersonne);
    if($tpersonne_page_head->tpersonne == "Member" && $personne->id_statuscompte == 1)
    {
    ?>
    <!-- Row -->
    <div class="row">
        <!-- Column -->
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Expiring Package Soon</h4>
                    <div class="table-responsive m-t-20">
                        <table class="table stylish-table">
                            <thead>
                            <tr>
                                <th>&nbsp;</th>
                                <th>Package</th>
                                <th>Period</th>
                                <th>Total</th>
                                <th>Paid</th>
                                <th>Rest</th>
                                <th>Rest Period</th>
                            </tr>
                            </thead>
                            <tbody>
                            @if(count($data_ontrading) > 0)
                                @foreach ($data_ontrading as $row)
                                    <tr>
                                        <!-- <td><span class="round"></span></td> -->
                                        <td><span class="round round-danger"><i class="fa fa-exclamation"></i></span></td>
                                        <td>{{ $row['abonnement'] }}</td>
                                        <td><span class="label label-danger">{{ $row['periode'] }}</span></td>
                                        <td>{{ $row['total_profit'] }}</td>
                                        <td>{{ $row['paid'] }}</td>
                                        <td>{{ $row['rest'] }}</td>
                                        <td><span class="label label-danger">{{ $row['rest_periode'] }}</span></td>
                                    </tr>
                                @endforeach
                            @else
                                <tr>
                                    <!-- <td><span class="round"></span></td> -->
                                    <td><span class="round round-success"><i class="fa fa-thumbs-o-up"></i></span></td>
                                    <td colspan="6" class="text-center">No package will expire soon :) !</td>
                                </tr>
                            @endif
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- Column -->
    </div>
    <!-- Row -->
    <!-- Row -->
    <div class="row">
        <!-- Column -->
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">Recent Posts</h4>
                    <h6 class="card-subtitle">Latest posts by Admin</h6>
                </div>
                <!-- ============================================================== -->
                <!-- Comment widgets -->
                <!-- ============================================================== -->
                <div class="comment-widgets">
                @if(count($posts))
                    @foreach($posts as $post)
                        <!-- Comment Row -->
                            <div class="d-flex flex-row comment-row">
                                <div class="p-2"><span class="round"><i class="fa fa-info"></i></span></div>
                                <div class="comment-text w-100">
                                    <h5>{{ $post->title }}</h5>
                                    <p class="m-b-5"><?php echo htmlspecialchars_decode(stripslashes($post->detail)) ?></p>
                                    <div class="comment-footer">
                                <span class="text-muted pull-right">
                                    <?php
                                    $date_post = new DateTime($post->created_at);
                                    echo $date_post->format('F d, Y \a\t H:i');
                                    ?>
                                </span>
                                    </div>
                                </div>
                            </div>
                            <!-- Comment Row -->
                        @endforeach
                @else
                    <!-- Comment Row -->
                        <div class="d-flex flex-row comment-row">
                            <div class="p-2"><span class="round"><i class="fa fa-info"></i></span></div>
                            <div class="comment-text w-100">
                                <h5>No new post !</h5>
                                <div class="comment-footer">
                                <span class="text-muted pull-right">
                                    <?php
                                    $date_post = new DateTime();
                                    echo $date_post->format('F d, Y');
                                    ?>
                                </span>
                                </div>
                            </div>
                        </div>
                        <!-- Comment Row -->
                @endif
                </div>
            </div>
        </div>
        <!-- Column -->
    </div>
    <!-- Row -->
    <!-- Row -->
    <div class="row">
        <!-- Column -->
        <div class="col-lg-12 col-md-12">
            <div class="card">
                <div class="card-body">
                    <select id="year" class="custom-select pull-right" onchange="drawChart({{ $personne->id_tpersonne }}, $(this).val());">
                        <option value="2018" @if(date("Y") == 2018) selected @endif>2018</option>
                        @foreach(range(2019, 2050) as $year)
                            <option value="{{ $year }}" @if(date("Y") == $year) selected @endif>{{ $year }}</option>
                        @endforeach
                    </select>
                    <h4 class="card-title">Sponsored Person Evolution</h4>
                    <h6 class="card-subtitle">Number of sponsored person by month</h6>
                    <!-- <div class="amp-pxl" style="height: 300px;"></div> -->
                    <canvas id="myChart" width="600" height="600"></canvas>
                    <!-- <div class="text-center">
                        <ul class="list-inline">
                            <li><h6 class="text-muted  text-info"><i class="fa fa-circle font-10 m-r-10"></i>Total of sponsored person</h6></li>
                        </ul>
                    </div> -->
                </div>
            </div>
        </div>
        <!-- Column -->
    </div>
    <!-- Row -->
    <?php } ?>
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/home/home.js"></script>
    <script>
        $(document).ready(function() {
            drawChart({{ $personne->id_tpersonne }}, $("#year").val());
        });
    </script>
@stop