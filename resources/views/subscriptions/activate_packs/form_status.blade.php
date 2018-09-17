<!-- Modal -->
<div id="PackStatusModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <form method="post" id="form-status-pack" class="form-material m-t-40">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" style="cursor: pointer;">&times;</button>
                    <h4 class="modal-title" id="titre_status_form" style="color: #FFFFFF;"></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Activate Pack <span class="required_field">(*)</span></label>
                        <select class="form-control" name="status_pack_active" id="status_pack_active">
                            <option value="1">Yes</option>
                            <option value="0">No</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="id_status_ontrading">
                    <button type="submit" class="btn btn-success">Save</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>