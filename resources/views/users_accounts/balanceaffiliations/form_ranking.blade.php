<!-- Modal -->
<div id="balanceaffiliationsByRankingModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <form method="post" id="form-balanceaffiliationsByRankingModal" class="form-material m-t-40">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header btn-info">
                    <button type="button" class="close" data-dismiss="modal" style="cursor: pointer;">&times;</button>
                    <h4 class="modal-title" id="titre_form_by_ranking" style="color: #FFFFFF;"></h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>Ranking <span class="required_field">(*)</span></label>
                        <select class="form-control" id="id_ranking_filter" name="id_ranking_filter" style="width: 100%;">
                            @foreach ($rakings as $raking)
                            <option value="{{ $raking->id }}">{{ $raking->ranking }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Add to Balance <strong>(Number negative or positive &isin; &real;) </strong><span class="required_field">(*)</span></label>
                        <input type="text" class="form-control form-control-line" name="balance_affiliation_by_ranking" id="balance_affiliation_by_ranking" placeholder="Enter Balance Affiliation" value="0" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="id_balance_affiliation_by_ranking">
                    <button type="submit" class="btn btn-success">Save</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>