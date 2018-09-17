<!-- Modal -->
<div id="supportticketsModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <form method="post" id="form-supporttickets" class="form-material m-t-40">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" style="cursor: pointer;">&times;</button>
                    <h4 class="modal-title" id="titre_form" style="color: #FFFFFF;"></h4>
                </div>
                <div class="modal-body">
                    <span id="list_supportticket_message" style="display: none;"></span>
                    <span id="form_supportticket_message">
                        <div class="form-group">
                            <label>Subject <span class="required_field">(*)</span></label>
                            <input type="text" class="form-control form-control-line" name="supportticket_subject" id="supportticket_subject" placeholder="Enter Subject" required>
                        </div>
                        <div class="form-group">
                            <label>Message <span class="required_field">(*)</span></label>
                            <textarea name="supportticket_message" id="supportticket_message" cols="10" rows="10" class="form-control" placeholder="Enter Message" required></textarea>
                        </div>
                    </span>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="id_supportticket">
                    <button id="open_ticket_submit" type="submit" class="btn btn-success">Open Ticket</button>
                    <button id="open_ticket_cancel" type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </form>
    </div>
</div>