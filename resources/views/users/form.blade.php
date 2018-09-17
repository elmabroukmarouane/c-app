<!-- Modal -->
<div id="AdminModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <form method="post" id="form-admin" class="form-material m-t-40" enctype="multipart/form-data">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" style="cursor: pointer;">&times;</button>
                    <h4 class="modal-title" id="titre_form" style="color: #FFFFFF;"></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="col-xs-12">
                            <span style="color: red;" id="msg_info"></span>
                        </div>
                    </div>
                    <!--<div class="form-group">
                        <div class="col-xs-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control form-control-line" name="nom" id="nom" placeholder="Lastname (Required)" required>
                            </div>
                        </div>
                    </div>-->
                    <div class="form-group">
                        <label>Lastname <span class="required_field">(*)</span></label>
                        <input type="text" class="form-control form-control-line" name="nom" id="nom" placeholder="Enter Lastname" required>
                    </div>
                    <!--<div class="form-group">
                        <div class="col-xs-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control" name="prenom" id="prenom" placeholder="Firstname (Required)" required>
                            </div>
                        </div>
                    </div>-->
                    <div class="form-group">
                        <label>Firstname <span class="required_field">(*)</span></label>
                        <input type="text" class="form-control" name="prenom" id="prenom" placeholder="Enter Firstname" required>
                    </div>
                    <!--<div class="form-group">
                        <div class="col-xs-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <input required type="text" class="form-control mydatepicker" name="date_naissance" id="date_naissance" placeholder="Birthdate (Required)">
                            </div>
                        </div>
                    </div>-->
                    <div class="form-group">
                        <label>Birthdate <span class="required_field">(*)</span></label>
                        <input required type="text" class="form-control mydatepicker" name="date_naissance" id="date_naissance" placeholder="Enter Birthdate">
                    </div>
                    <div class="form-group">
                        <label>Phone Number <span class="required_field">(*)</span></label>
                        <input type="text" class="form-control form-control-line" name="telephone" id="telephone" placeholder="Enter Phone Number" required>
                    </div>
                    <!--<div class="form-group">
                        <div class="col-xs-12">
                            <textarea name="adresse" id="adresse" cols="10" rows="10" class="form-control" placeholder="Enter Address" required></textarea>
                        </div>
                    </div>-->
                    <div class="form-group">
                        <label>Address <span class="required_field">(*)</span></label>
                        <textarea name="adresse" id="adresse" cols="10" rows="10" class="form-control" placeholder="Enter Address" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Image</label>
                        <div class="fileinput fileinput-new input-group" data-provides="fileinput">
                            <div class="form-control" data-trigger="fileinput">
                                <i class="fa fa-file-o fileinput-exists"></i>
                                <span class="fileinput-filename"></span>
                            </div>
                            <span class="input-group-addon btn btn-default btn-file">
                                <span class="fileinput-new">Select file</span>
                                <span class="fileinput-exists">Change</span>
                                <input type="hidden">
                                <input name="image" id="image" class="custom-file-input" type="file">
                            </span>
                            <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                        </div>
                    </div>
                    <!--<div class="form-group">
                        <div class="col-xs-12">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                <input type="email" class="form-control" name="email" id="email" placeholder="Email (Required)" required>
                            </div>
                        </div>
                    </div>-->
                    <div class="form-group">
                        <label>Email <span class="required_field">(*)</span></label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="Enter Email" required>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <label>Password <span id="required_password" style="display: none;">(*)</span></label>
                            <div class="input-group">
                                <span class="input-group-addon" onclick="afficherpassword();" style="cursor: pointer;"><i class="fa fa-eye" id="icon_password"></i></span>
                                &nbsp;<input type="password" id="password" name="password" class="form-control" placeholder="Enter Password">
                                <input type="hidden" name="afficher_password" id="afficher_password" value="non" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <label>Confirm Password <span id="required_confirm_password" style="display: none;">(*)</span></label>
                            <div class="input-group">
                                <span class="input-group-addon" onclick="afficherconfirmpassword();" style="cursor: pointer;"><i class="fa fa-eye" id="icon_confirmpassword"></i></span>
                                &nbsp;<input type="password" id="confirm_password" name="confirm_password" class="form-control" placeholder="Re-enter Password">
                                <input type="hidden" name="afficher_confirmPassword" id="afficher_confirmPassword" value="non" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <select class="form-control select2" id="id_tpersonne" name="id_tpersonne" data-placeholder="Choose a user profil ..." style="width: 100%;">
                                <!--<option></option>-->
                                @foreach($tpersonnes as $tpersonne)
                                    <option value="{{ $tpersonne->id }}" style="text-transform: capitalize;">{{ $tpersonne->tpersonne }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <select class="form-control select2" id="id_statuscompte" name="id_statuscompte" data-placeholder="Choose a status ..." style="width: 100%;">
                                <!--<option></option>-->
                                @foreach($statuscomptes as $statuscompte)
                                    <option style="text-transform: capitalize;" value="{{ $statuscompte->id }}">{{ $statuscompte->status_compte }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="id_personne">
                    <button type="submit" class="btn btn-success">Save</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>