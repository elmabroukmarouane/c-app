<!-- Modal -->
<div id="companywalletsModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <form method="post" id="form-companywallets" class="form-material m-t-40">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" style="cursor: pointer;">&times;</button>
                    <h4 class="modal-title" id="titre_form" style="color: #FFFFFF;"></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Currencie <span class="required_field">(*)</span></label>
                        <select class="form-control select2" id="id_currencie" name="id_currencie" data-placeholder="Choose a status ..." style="width: 100%;">
                            @foreach($currencies as $currencie)
                                <option style="text-transform: capitalize;" value="{{ $currencie->id }}">{{ $currencie->currencie }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Wallet Name<span class="required_field">(*)</span></label>
                        <input type="text" class="form-control form-control-line" name="wallet_name" id="wallet_name" placeholder="Enter your wallet name" required>
                    </div>
                    <div class="form-group">
                        <label>Wallet Address <span class="required_field">(*)</span></label>
                        <input type="text" class="form-control form-control-line" name="wallet_adresse" id="wallet_adresse" placeholder="Enter your wallet address" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="id_companywallet">
                    <button type="submit" class="btn btn-success">Save</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>