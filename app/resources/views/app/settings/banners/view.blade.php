@extends('layouts.app')
@section('content')

<div class="container-fluid">
	<div class="page-header">
		<div class="row">
			<div class="col-sm-6">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="{{ url('/') }}/admin"><i class="f-16 fa fa-home"></i></a></li>
					<li class="breadcrumb-item">Home</li>
                    <li class="breadcrumb-item">Settings</li>
					<li class="breadcrumb-item">{{$PageTitle}}</li>
				</ol>
			</div>
			<div class="col-sm-6">
                <div class="bookmark pull-right">
                    <a href="{{url('/')}}/admin/settings/banners/upload" class="btn btn sm btn-outline-dark" id="btnUploadBanner">Upload</a>
                </div>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12 mt-20">
			<div class="card">
				<div class="card-header">
					<h5>Mobile Banner Images</h5>
				</div>
				<div class="my-gallery card-body row gallery-with-description">
					@foreach($MbannerImages as $image)
						<figure class="col-xl-4 col-sm-6" data-tran-no="{{$image->TranNo}}">
							<a href="{{url('/')}}/{{$image->BannerImage}}" data-lightbox="banner-images">
								<img src="{{url('/')}}/{{$image->BannerImage}}" alt="Image {{$loop->index}}" width="500" height="250">
							</a>
							<div class="caption text-center py-3">
								@if($crud['edit']==1)
									<button type="button" data-id="{{$image->TranNo}}" class="btn btn-sm btn-outline-warning btnEdit mr-10"><i class="fa fa-pencil"></i></button>
								@endif
								@if($crud['delete']==1)
									<button type="button" data-id="{{$image->TranNo}}" class="btn btn-sm btn-outline-danger btnDelete"><i class="fa fa-trash"></i></button>
								@endif
							</div>
						</figure>
					@endforeach
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Container-fluid Ends-->
<link rel="stylesheet" href="{{url('/')}}/assets/plugins/lightbox/css/lightbox.css">
@endsection
@section('scripts')
<script src="{{url('/')}}/assets/plugins/lightbox/js/lightbox.js"></script>
<script>
	$(document).ready(function(){

		$(document).on('click','.btnEdit',function(){
			window.location.replace("{{url('/')}}/admin/settings/banners/edit/"+ $(this).attr('data-id'));
		});
		$(document).on('click','.btnDelete',function(e){
        	e.preventDefault();
            var id = $(this).attr("data-id");
            swal({
                title: "Are you sure?",
                text: "You want to Delete this Category!",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-outline-success",
                confirmButtonText: "Yes, Delete it!",
                closeOnConfirm: false
            },function(){
                swal.close();
                $.ajax({
                    type: "post",
                	headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') },
                    url: "{{url('/')}}/admin/settings/banners/delete/"+ id,
                    success: function (response) {
                        if(response.status==true){
                            toastr.success(response.message, "Success", {positionClass: "toast-top-right",containerId: "toast-top-right",showMethod: "slideDown",hideMethod: "slideUp",})
                        	$('figure[data-tran-no="'+id+'"]').remove();
                		}else{
							toastr.error(response.message, "Failed", {positionClass: "toast-top-right",containerId: "toast-top-right",showMethod: "slideDown",hideMethod: "slideUp",})
						}
					}
            	});
        	});
		});
	});
</script>
@endsection
