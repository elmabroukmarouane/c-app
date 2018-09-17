<div class="modal modal-fullscreen fade" id="modal-fullscreen" tabindex="-1" role="dialog" aria-labelledby="ModalFullScreen" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-body">
        <div class="text-center"><h3><strong>Confirmation</strong></h3></div>
		<div>
			<p class="text-center">Are you sure you want to logout?</p>
			<p class="text-center">
				<a class="btn btn-danger" data-dismiss="modal" style="color: white; font-weight: bold;">Nope <i class="fa fa-smile-o"></i> !</a>
				<a href="{{ route('logout') }}" class="btn btn-success" style="color: white; font-weight: bold;">Yup <i class="fa fa-frown-o"></i> !</a>
			</p>
		</div>
      </div>
    </div>
  </div>
</div>

<style type="text/css">
	/* .modal-fullscreen */

	.modal-fullscreen {
	    background: transparent;
	}
	.modal-fullscreen .modal-content {
		padding: 25%;
	    background: transparent;
	    border: 0;
	    -webkit-box-shadow: none;
	    box-shadow: none;
	}
	.modal-backdrop.modal-backdrop-fullscreen {
	    background: #ffffff;
	}
	.modal-backdrop.modal-backdrop-fullscreen.in {
	    opacity: .85;
	    filter: alpha(opacity=85);
	}

	/* .modal-fullscreen size: we use Bootstrap media query breakpoints */

	.modal-fullscreen .modal-dialog
    {
	    margin: 0;
	    margin-right: auto;
	    margin-left: auto;
	    width: 100%;
	}
	@media (min-width: 768px) {
	    .modal-fullscreen .modal-dialog {
	        width: 750px;
	    }
	}
	@media (min-width: 992px) {
	    .modal-fullscreen .modal-dialog {
	        width: 970px;
	    }
	}
	@media (min-width: 1200px) {
	    .modal-fullscreen .modal-dialog {
	         width: 1170px;
	    }
	}
</style>
<script>
	$(".modal-fullscreen").on('show.bs.modal', function () {
	  setTimeout( function() {
	    $(".modal-backdrop").addClass("modal-backdrop-fullscreen");
	  }, 0);
	});
	$(".modal-fullscreen").on('hidden.bs.modal', function () {
	  $(".modal-backdrop").addClass("modal-backdrop-fullscreen");
	});
</script>