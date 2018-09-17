<!-- Modal -->
<div id="companyaccountsModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <form method="post" id="form-companyaccounts" class="form-material m-t-40">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" style="cursor: pointer;">&times;</button>
                    <h4 class="modal-title" id="titre_form" style="color: #FFFFFF;"></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label style="text-decoration: underline">Bank</label>
                        <br />
                        <span id="bank"></span>
                    </div>
                    <div class="form-group">
                        <label style="text-decoration: underline">Bank Country</label>
                        <br />
                        <span id="bank_account_country"></span>
                    </div>
                    <div class="form-group">
                        <label style="text-decoration: underline">Account Number</label>
                        <br />
                        <span id="bank_account_number"></span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </form>
    </div>
</div>