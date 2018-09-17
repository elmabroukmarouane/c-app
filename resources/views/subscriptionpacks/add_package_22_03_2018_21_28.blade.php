<!-- Modal -->
<div id="subscriptionPackModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <form method="post" id="form-subscription-pack" class="form-material m-t-40">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" style="cursor: pointer;">&times;</button>
                    <h4 class="modal-title" id="titre_form" style="color: #FFFFFF;"></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Period Pack <span class="required_field">(*)</span></label>
                        <!-- <input required type="text" class="form-control mydatepicker" name="periode_pack" id="periode_pack" placeholder="Enter The period of the pack"> -->
                        <select class="form-control" name="periode_pack" id="periode_pack">
                            <option value="1">1 month</option>
                            <option value="3">3 months</option>
                            <option value="6">6 months</option>
                            <option value="12">1 year</option>
                            <option value="24">2 years</option>
                            <option value="36">3 years</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Payment Type <span class="required_field">(*)</span></label>
                        <select class="form-control" name="type_payment" id="type_payment" onchange="fill_select_payment($(this).find(':selected').val());">
                            <option value="Bank" selected="selected">Bank</option>
                            <option value="Wallet">Wallet</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Payment Account or Wallet <span class="required_field">(*)</span></label>
                        <select class="form-control" name="payment_account_wallet" id="payment_account_wallet">
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="id_personne">
                    <input type="hidden" id="id_packabonnementplatform">
                    <button type="submit" class="btn btn-success">Take it</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>