<!-- Modal -->
<div id="status_supportticketsModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <form method="post" id="form-status_supporttickets" class="form-material m-t-40">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" style="cursor: pointer;">&times;</button>
                    <h4 class="modal-title" id="titre_form_status" style="color: #FFFFFF;"></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Status Ticket <span class="required_field">(*)</span></label>
                        <select class="form-control" id="status_supporttickets" name="status_supporttickets" style="width: 100%;">
                            <option value="0">Open</option>
                            <option value="1">Close</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="id_status_supportticket">
                    <button type="submit" class="btn btn-success">Update Status</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>