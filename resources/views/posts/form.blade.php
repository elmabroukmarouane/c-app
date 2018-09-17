<!-- Modal -->
<div id="postsModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <form method="post" id="form-posts" class="form-material m-t-40">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" style="cursor: pointer;">&times;</button>
                    <h4 class="modal-title" id="titre_form" style="color: #FFFFFF;"></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Title <span class="required_field">(*)</span></label>
                        <input type="text" class="form-control form-control-line" name="title" id="title" placeholder="Enter post" required>
                    </div>
                    <div class="form-group">
                        <label>Detail <span class="required_field">(*)</span></label>
                        <textarea name="detail" id="detail" cols="10" rows="10" class="form-control" placeholder="Enter Detail" required></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="id_post">
                    <button type="submit" class="btn btn-success">Save</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>