<!-- Modal -->
<div id="update_questrepsModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <form method="post" id="update-form-questreps" class="form-material m-t-40">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" style="cursor: pointer;">&times;</button>
                    <h4 class="modal-title" id="update_titre_form" style="color: #FFFFFF;"></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label> Security Question <span class="required_field"> (*)</span></label>
                        <select class="form-control" name="update_id_question" id="update_id_question">
                            @foreach ($questions_array as $question_array)
                            <option value="{{ $question_array['id'] }}">{{ $question_array['question']}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label> Security Answer <span class="required_field"> (*)</span></label>
                        <input type="text" class="form-control form-control-line" name="update_reponse" id="update_reponse" placeholder="Enter your answer" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="update_id_questrep">
                    <button type="submit" class="btn btn-success">Save</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>