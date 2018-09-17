<!-- Modal -->
<div id="updateProfilModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <form method="post" id="form-update-profil" class="form-material m-t-40" enctype="multipart/form-data">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" style="cursor: pointer;">&times;</button>
                    <h4 class="modal-title" id="update_profil_titre_form" style="color: #FFFFFF;"></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="col-xs-12">
                            <span style="color: red;" id="update_profil_msg_info"></span>
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
                    <div class="form-group" id="div_form_group_profil_nom">
                        <label>Lastname <span class="required_field">(*)</span></label>
                        <input type="text" class="form-control form-control-line" name="update_profil_nom" id="update_profil_nom" placeholder="Enter Lastname" required>
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
                        <input type="text" class="form-control" name="update_profil_prenom" id="update_profil_prenom" placeholder="Enter Firstname" required>
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
                        <input required type="text" class="form-control mydatepicker" name="update_profil_date_naissance" id="update_profil_date_naissance" placeholder="Enter Birthdate">
                    </div>
                    <div class="form-group">
                        <label>Phone Number <span class="required_field">(*)</span></label>
                        <input type="text" class="form-control" name="update_profil_telephone" id="update_profil_telephone" placeholder="Enter Phone Number" required>
                    </div>
                    <!--<div class="form-group">
                        <div class="col-xs-12">
                            <textarea name="adresse" id="adresse" cols="10" rows="10" class="form-control" placeholder="Enter Address" required></textarea>
                        </div>
                    </div>-->
                    <div class="form-group">
                        <label>Address <span class="required_field">(*)</span></label>
                        <textarea name="update_profil_adresse" id="update_profil_adresse" cols="10" rows="10" class="form-control" placeholder="Enter Address" required></textarea>
                    </div>
                    <!--<div class="form-group">
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
                                <input name="update_profil_image" id="update_profil_image" class="custom-file-input" type="file">
                            </span>
                            <a href="#" class="input-group-addon btn btn-default fileinput-exists" data-dismiss="fileinput">Remove</a>
                        </div>
                    </div>-->
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
                        <input type="email" class="form-control" name="update_profil_email" id="update_profil_email" placeholder="Enter Email" required>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <label>Password <span id="update_profil_required_password" style="display: none;">(*)</span></label>
                            <div class="input-group">
                                <span class="input-group-addon" onclick="update_profil_afficherpassword();" style="cursor: pointer;"><i class="fa fa-eye" id="update_profil_icon_password"></i></span>
                                &nbsp;<input type="password" id="update_profil_password" name="update_profil_password" class="form-control" placeholder="Enter Password">
                                <input type="hidden" name="afficher_password" id="update_profil_afficher_password" value="non" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <label>Confirm Password <span id="update_profil_required_confirm_password" style="display: none;">(*)</span></label>
                            <div class="input-group">
                                <span class="input-group-addon" onclick="update_profil_afficherconfirmpassword();" style="cursor: pointer;"><i class="fa fa-eye" id="update_profil_icon_confirmpassword"></i></span>
                                &nbsp;<input type="password" id="update_profil_confirm_password" name="update_profil_confirm_password" class="form-control" placeholder="Re-enter Password">
                                <input type="hidden" name="afficher_confirmPassword" id="update_profil_afficher_confirmPassword" value="non" />
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Activate Security Questions</label>
                        <select class="form-control" id="update_active_security_questions" name="update_active_security_questions" style="width: 100%;">
                            <option value="0">Disabled</option>
                            <option value="1">Enabled</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="update_profil_id_personne">
                    <button type="submit" class="btn btn-success">Save</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>