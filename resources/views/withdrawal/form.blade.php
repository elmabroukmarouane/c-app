<!-- Modal -->
<div id="withdrawalsModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <form method="post" id="form-withdrawals" class="form-material m-t-40">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" style="cursor: pointer;">&times;</button>
                    <h4 class="modal-title" id="titre_form" style="color: #FFFFFF;"></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Amount Withdrawal <span class="required_field">(*)</span></label>
                        <input type="text" class="form-control form-control-line" name="amount_withdrawal" id="amount_withdrawal" placeholder="Enter Amount Withdrawal" required>
                    </div>
                    <div class="form-group">
                        <label>Payment Type <span class="required_field">(*)</span></label>
                        <select class="form-control" name="type_payment" id="type_payment">
                            <option value="Bank" selected="selected">Bank</option>
                            <option value="Wallet">Wallet</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="id_balance_affiliation">
                    <input type="hidden" id="total_balance_amount">
                    <input type="hidden" id="total_montant_pvbalancepersonne">
                    <button type="submit" class="btn btn-success">Save</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>