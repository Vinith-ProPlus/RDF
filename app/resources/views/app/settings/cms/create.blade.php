@extends('layouts.app')
@section('content')
<div class="container-fluid">
	<div class="page-header">
		<div class="row">
			<div class="col-sm-12">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="{{ url('/') }}" data-original-title="" title=""><i class="f-16 fa fa-home"></i></a></li>
					<li class="breadcrumb-item">Settings</li>
                    <li class="breadcrumb-item"><a href="{{url('/admin/settings/cms/')}}">{{$PageTitle}}</a></li>
					<li class="breadcrumb-item">Update</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row  d-flex justify-content-center ">
		<div class="col-sm-12 ">
			<div class="row">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-header text-center">
							<div class="form-row align-items-center">
								<div class="col-md-4">	</div>
								<div class="col-md-4 my-2"><h5>{{$PageTitle}}</h5></div>
								<div class="col-md-4 my-2 text-right text-md-right">
								</div>
							</div>
						</div>
                        <div class="card-body">
                            <div class="row mt-20">
                                <div class="col-sm-6">
                                    <div class="form-group">
                                        <label for="txtPageName"> Page Name  </label>
                                        <input type="text" Disabled class="form-control" placeholder="Page Name" id="txtPageName" value="<?php if($isEdit){ echo $EditData[0]->PageName;} ?>">
                                        <div class="errors" id="txtPageName-err"></div>
                                    </div>
                                </div>
                                <div class="col-sm-12 mt-20">
                                    <div class="form-group">
                                        <label for="txtPageName"> Page Content </label>
                                        <div id="editor" class="ckeditor">
                                            <?php if($isEdit){ echo $EditData[0]->PageContent;} ?>
                                        </div>
                                        <div class="errors" id="txtPageName-err"></div>
                                    </div>
                                </div>
                                @if(count($languages) > 0)
                                    <div class="col-sm-12 text-center mt-20">
                                        <label class="align-middle fw-bold">Page Content Translations</label>
                                        @foreach($languages as $index=>$language)
                                            <div class="form-group text-left mt-20">
                                                <label class="txtPCHIn_{{ $language->code }}">Page Content
                                                    In {{ $language->name_in_english }}<span class="required"> * </span></label>
                                                <div class="ckeditor PchLanguageFieldsCheck"
                                                     id="txtPCHIn_{{ $language->code }}"
                                                     data-language-code="{{ $language->code }}"
                                                     data-language="{{ $language->name_in_english }}">{!! $isEdit ? ($EditData[0]->PageContentInTranslation->{$language->code} ?? '') : ''  !!} </div>
                                                <div class="errors" id="txtPCHIn_{{ $language->code }}-err"></div>
                                            </div>
                                        @endforeach
                                    </div>
                                @endif
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="row">
                                <div class="col-sm-12 text-right">
                                    @if($crud['view'])
                                        <a href="{{url('/')}}/admin/settings/cms/" class="btn btn-sm btn-outline-dark" id="btnCancel">Back</a>
                                    @endif
                                    @if(($crud['view'])&&($crud['edit']))
                                        <button class="btn btn-outline-success btn-sm" id="btnSave" type="button" >@if($isEdit) Update @else Create @endif</button>
                                    @endif
                                </div>
                            </div>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection
@section('scripts')
    <script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
    <script>
    $(document).ready(function(){
        var editorClassElements = document.querySelectorAll('.ckeditor');
        editorClassElements.forEach(function(element) {
            CKEDITOR.replace(element.id);
        });

        $('#btnSave').click(function(){
            let formData = {
                pageContent: CKEDITOR.instances.editor.getData(),
                PageContentInTranslation: {}
            };
            document.querySelectorAll('.PchLanguageFieldsCheck').forEach(function(element) {
                const languageCode = element.getAttribute('data-language-code');
                formData.PageContentInTranslation[languageCode] = CKEDITOR.instances[element.id].getData();
            });
            formData.PageContentInTranslation = JSON.stringify(formData.PageContentInTranslation);
            swal({
                    title: "Are you sure?",
                    text: "You want @if($isEdit)Update @else Save @endif this Page Content!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-outline-success",
                    confirmButtonText: "Yes, @if($isEdit==true)Update @else Save @endif it!",
                    closeOnConfirm: false
                },
                function(){
                    swal.close();
                    btnLoading($('#btnSave'));
                    @if($isEdit) let posturl="{{url('/')}}/admin/settings/cms/edit/{{$CID}}"; @else let posturl="{{url('/')}}/admin/settings/cms-pages"; @endif
                    $.ajax({
                        type:"post",
                        url:posturl,
                        headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') },
                        data:formData,
                        error:function(e, x, settings, exception){ajaxErrors(e, x, settings, exception);},
                        complete: function(e, x, settings, exception){btnReset($('#btnSave'));ajaxIndicatorStop();},
                        success:function(response){
                            document.documentElement.scrollTop = 0;
                            if(response.status==true){
                                swal({
                                    title: "SUCCESS",
                                    text: response.message,
                                    type: "success",
                                    showCancelButton: false,
                                    confirmButtonClass: "btn-outline-success",
                                    confirmButtonText: "Okay",
                                    closeOnConfirm: false
                                },function(){
                                    @if($isEdit==true)
                                        window.location.replace("{{url('/')}}/admin/settings/cms");
                                    @else
                                        window.location.reload();
                                    @endif
                                });
                            }else{
                                toastr.error(response.message, "Failed", {
                                    positionClass: "toast-top-right",
                                    containerId: "toast-top-right",
                                    showMethod: "slideDown",
                                    hideMethod: "slideUp",
                                    progressBar: !0
                                })
                            }
                        }
                    });
                });
		});
    });
</script>
@endsection
