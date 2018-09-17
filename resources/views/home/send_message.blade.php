@extends('layouts.layout')
@section('content')
    <div class="card">
        <div class="card-body">
            <div class="row">
                <!-- Contact -->
                <h4><strong>CONTACT ADMINISTRATOR</strong></h4>
                <br />
                <br />
                <form method="post" id="form-send-msg-admin">
                    <div class="form-group">
                        <textarea class="form-control" id="msg_textarea_admin" rows="3" placeholder="Message" required></textarea>
                    </div>
                    <input type="hidden" class="form-control" id="id_personne_msg" value="{{ $personne->id }}" />
                    <button type="submit" class="btn btn-info">Send</button>
                </form>
                <!-- End Contact -->
            </div>
        </div>
    </div>
@stop
@section('scripts')
    <script>
        CKEDITOR.replace('msg_textarea_admin');
    </script>
@stop