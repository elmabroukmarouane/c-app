<!-- Modal -->
<div id="packsModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <form method="post" id="form-packs" class="form-material m-t-40">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" style="cursor: pointer;">&times;</button>
                    <h4 class="modal-title" id="titre_form" style="color: #FFFFFF;"></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Pack Name <span class="required_field">(*)</span></label>
                        <input type="text" class="form-control form-control-line" name="pack_titre" id="pack_titre" placeholder="Enter pack" required>
                    </div>
                    <div class="form-group">
                        <label>Pack Price <span class="required_field">(*)</span></label>
                        <input type="text" class="form-control form-control-line" name="pack_prix" id="pack_prix" placeholder="Enter pack" required>
                    </div>
                    <div class="form-group">
                        <label>Description Part 1 <span class="required_field">(*)</span></label>
                        <textarea name="pack_description_1" id="pack_description_1" rows="3" class="form-control" placeholder="Enter Description Part 1" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Description Part 2 <span class="required_field">(*)</span></label>
                        <textarea name="pack_description_2" id="pack_description_2" rows="3" class="form-control" placeholder="Enter Description Part 2" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Popular Pack <span class="required_field">(*)</span></label>
                        <select class="form-control" name="pack_popular" id="pack_popular">
                            <option value="1">Yes</option>
                            <option value="0">No</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="id_pack">
                    <button type="submit" class="btn btn-success">Save</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>