@extends('layouts.layout')
@section('content')
    <!-- Row -->
                <div class="row">
                    <!-- Column -->
                    <div class="col-lg-12 col-xlg-12 col-md-12">
                        <div class="card">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs profile-tab" role="tablist">
                                <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#home" role="tab">Profil</a> </li>
                                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#profile" role="tab">Security</a> </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="home" role="tabpanel">
                                    <div class="card-body">
                                            <center class="m-t-30"> 
                                                <h4 id="profil_page_nom_prenom" class="card-title m-t-10">Hanna Gover</h4>
                                            </center>
                                        </div>
                                        <div>
                                            <hr> </div>
                                        <div class="card-body"> 
                                            <small class="text-muted">Email address </small>
                                            <h6 id="profil_page_email"><a href="mailto:hannagover@gmail.com">hannagover@gmail.com</a></h6> 
                                            <small class="text-muted p-t-30 db">Birthdate</small>
                                            <h6 id="profil_page_date_naissance">01/01/1990</h6>  
                                            <small class="text-muted p-t-30 db">Phone Number</small>
                                            <h6 id="profil_page_telephone">+91 654 784 547</h6> 
                                            <small class="text-muted p-t-30 db">Address</small>
                                            <h6 id="profil_page_adresse">71 Pilgrim Avenue Chevy Chase, MD 20815</h6>
                                        </div>
                                </div>
                                <!--second tab-->
                                <div class="tab-pane" id="profile" role="tabpanel">
                                    <div class="card-body">
                                        <div class="form-group" id="div_form_group_profil_nom">
                                            <label><strong>Lastname</strong></label>
                                            <input type="text" class="form-control form-control-line" name="update_profil_nom" id="update_profil_nom" placeholder="Enter Lastname" value="{{ $personne->nom }}" @if($personne->nom != "") readonly @endif required>
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Firstname</strong></label>
                                            <input type="text" class="form-control" name="update_profil_prenom" id="update_profil_prenom" placeholder="Enter Firstname" value="{{ $personne->prenom }}" @if($personne->prenom != "") readonly @endif required>
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Birthdate</strong></label>
                                            <input required type="text" class="form-control mydatepicker" name="update_profil_date_naissance" id="update_profil_date_naissance" placeholder="Enter Birthdate" value="{{ $personne->date_naissance }}" @if($personne->date_naissance != "") readonly @endif>
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Phone Number</strong></label>
                                            <input type="text" class="form-control" name="update_profil_telephone" id="update_profil_telephone" placeholder="Enter Phone Number" value="{{ $personne->telephone }}" @if($personne->telephone != "") readonly @endif required>
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Address</strong></label>
                                            <textarea name="update_profil_adresse" id="update_profil_adresse" cols="10" rows="10" class="form-control" placeholder="Enter Address" @if($personne->adresse != "") readonly @endif required>{{ $personne->adresse }}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label><strong>Email</strong></label>
                                            <input type="email" class="form-control" name="update_profil_email" id="update_profil_email" placeholder="Enter Email" value="{{ $user->email }}" @if($user->email != "") readonly @endif required>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <label for="update_old_profil_password"><strong>OLD Password</strong> <span id="update_old_profil_required_password" style="display: none;">(*)</span></label>
                                                <div class="input-group">
                                                    <span class="input-group-addon" onclick="update_old_profil_afficherpassword();" style="cursor: pointer;"><i class="fa fa-eye" id="update_old_profil_icon_password"></i></span>
                                                    <input type="password" id="update_old_profil_password" name="update_old_profil_password" class="form-control" placeholder="Enter OLD Password">
                                                    <input type="hidden" name="afficher_old_password" id="update_old_profil_afficher_password" value="non" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <label for="update_profil_password"><strong>New Password</strong> <span id="update_profil_required_password" style="display: none;">(*)</span></label>
                                                <div class="input-group">
                                                    <span class="input-group-addon" onclick="update_profil_afficherpassword();" style="cursor: pointer;"><i class="fa fa-eye" id="update_profil_icon_password"></i></span>
                                                    <input type="password" id="update_profil_password" name="update_profil_password" class="form-control" placeholder="Enter New Password">
                                                    <input type="hidden" name="afficher_password" id="update_profil_afficher_password" value="non" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-xs-12">
                                                <label for="update_profil_confirm_password"><strong>Confirm New Password</strong> <span id="update_profil_required_confirm_password" style="display: none;">(*)</span></label>
                                                <div class="input-group">
                                                    <span class="input-group-addon" onclick="update_profil_afficherconfirmpassword();" style="cursor: pointer;"><i class="fa fa-eye" id="update_profil_icon_confirmpassword"></i></span>
                                                    <input type="password" id="update_profil_confirm_password" name="update_profil_confirm_password" class="form-control" placeholder="Re-enter New Password">
                                                    <input type="hidden" name="afficher_confirmPassword" id="update_profil_afficher_confirmPassword" value="non" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="update_active_security_questions"><strong>Activate Security Questions</strong></label>
                                            <select class="form-control" id="update_active_security_questions" name="update_active_security_questions" style="width: 100%;">
                                                <option value="0" @if ($user->active_security_questions == 0)
                                                    selected
                                                @endif>Disabled</option>
                                                <option value="1" @if ($user->active_security_questions == 1)
                                                    selected
                                                @endif>Enabled</option>
                                            </select>
                                        </div>              
                                        <div class="form-group">
                                            <button type="button" class="btn btn-info" id="update_profil_page_button">Update Profil</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
                <!-- Row -->
@stop
@section('scripts')
    <script>
        $( document ).ready(function() {
            ProfilShowInfo({{$personne->id}});
        });
    </script>
@stop