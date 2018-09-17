<!-- Modal -->
<div id="questrepsModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <form method="post" id="form-questreps" class="form-material m-t-40">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" style="cursor: pointer;">&times;</button>
                    <h4 class="modal-title" id="titre_form" style="color: #FFFFFF;"></h4>
                </div>
                <div class="modal-body">
                    {{--  <div class="form-group">
                        <button id="add_question_form" class="btn btn-outline-info waves-effect waves-light" type="button" onclick="add_question_click_button()"><span class="btn-label"><i class="fa fa-plus"></i></span>Add</button>
                    </div>
                    @if (count($questions_array) > 0)  --}}
                    <div class="form-group">
                        <label> Security Question 1 <span class="required_field"> (*)</span></label>
                        <select class="form-control" name="add_id_question_1" id="add_id_question_1">
                            @foreach ($questions_array as $question_array)
                            <option value="{{ $question_array['id'] }}">{{ $question_array['question']}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label> Security Answer 1 <span class="required_field"> (*)</span></label>
                        <input type="text" class="form-control form-control-line" name="add_reponse_1" id="add_reponse_1" placeholder="Enter your answer" required>
                    </div>
                    <div class="form-group">
                        <label> Security Question 2 <span class="required_field"> (*)</span></label>
                        <select class="form-control" name="add_id_question_2" id="add_id_question_2">
                            @foreach ($questions_array as $question_array)
                            <option value="{{ $question_array['id'] }}">{{ $question_array['question']}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label> Security Answer 2 <span class="required_field"> (*)</span></label>
                        <input type="text" class="form-control form-control-line" name="add_reponse_2" id="add_reponse_2" placeholder="Enter your answer" required>
                    </div>
                    <div class="form-group">
                        <label> Security Question 3 <span class="required_field"> (*)</span></label>
                        <select class="form-control" name="add_id_question_3" id="add_id_question_3">
                            @foreach ($questions_array as $question_array)
                            <option value="{{ $question_array['id'] }}">{{ $question_array['question']}}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label> Security Answer 3 <span class="required_field"> (*)</span></label>
                        <input type="text" class="form-control form-control-line" name="add_reponse_3" id="add_reponse_3" placeholder="Enter your answer" required>
                    </div>
                    {{--  @else
                    <span id="answered_all_questions" style="color: red; font-weight: bold; text-align: center">You have answered all the questions. Please Update it if you want to !</span>
                    @endif  --}}
                    <span id="questreps_items"></span>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="id_questrep">
                    <button id="submit_button_questreps" type="submit" class="btn btn-success">Save</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>