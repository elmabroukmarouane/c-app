@extends('layouts.layout')
@section('content')
    <script>
        var posts_list = new Array();
    </script>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive m-t-40">
                <table id="posts-list" class="display nowrap table table-hover table-striped table-bordered" cellspacing="0" width="100%">
                    <thead>
                    <tr>
                        <th>&nbsp;</th>
                        <th>Post Title</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @include('posts.form_show')
@stop
@section('scripts')
    <script type="text/javascript" src="js/ajax/home/posts.js"></script>
@stop