<!-- Modal -->
<div id="AdminStatusModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <form method="post" id="form-status-admin" class="form-material m-t-40" enctype="multipart/form-data">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" style="cursor: pointer;">&times;</button>
                    <h4 class="modal-title" id="titre_status_form" style="color: #FFFFFF;"></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="col-xs-12">
                            <span style="color: red;" id="msg_status_info"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-12">
                            <select class="form-control select2" id="id_status_statuscompte" name="id_status_statuscompte" data-placeholder="Choose a status ..." style="width: 100%;">
                                <!--<option></option>-->
                                @foreach($statuscomptes as $statuscompte)
                                    <option style="text-transform: capitalize;" value="{{ $statuscompte->id }}">{{ $statuscompte->status_compte }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="id_status_personne">
                    <button type="submit" class="btn btn-success">Change</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>