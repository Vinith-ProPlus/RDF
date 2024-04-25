@extends('layouts.app')
@section('content')
<div class="container-fluid">
	<div class="page-header">
		<div class="row">
			<div class="col-sm-12">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="{{ url('/') }}" data-original-title="" title=""><i class="f-16 fa fa-home"></i></a></li>
					<li class="breadcrumb-item">General Master</li>
					<li class="breadcrumb-item"><a href="{{url('/')}}/admin/master/general/states/" data-original-title="" title="">{{$PageTitle}}</a></li>
                    <li class="breadcrumb-item">@if($isEdit==true)Update @else Create @endif</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row d-flex justify-content-center">
		<div class="col-12 col-sm-12 col-lg-8">
			<div class="card">
				<div class="card-header text-center"><h5 class="mt-10">{{$PageTitle}}</h5></div>
				<div class="card-body " >
                    <div class="row">
                        <div class="col-sm-6 mt-20">
                            <div class="form-group">
                                <label class="txtStateName">Subject<span class="required"> * </span></label>
                                <input type="text" class="form-control  {{$Theme['input-size']}}" id="txtStateName" value="<?php if($isEdit==true){ echo $EditData[0]->StateName;} ?>">
                                <div class="errors" id="txtStateName-err"></div>
                            </div>
                        </div>
                        <div class="col-sm-6 mt-20">
                            <div class="form-group">
                                <label for="lstCountry">Ticket For<span class="required"> * </span></label>
                                <select class="form-control  {{$Theme['input-size']}} select2" id="lstSupportType" data-selected="<?php if($isEdit){echo $EditData[0]->CountryID;} ?>">
                                    <option value="Vendor">Vendor</option>
                                    <option value="Customer">Customer</option>
                                </select>
                                <div class="errors" id="lstCountry-err"></div>
                            </div>
                        </div>
                        <div class="col-sm-6 mt-20">
                            <div class="form-group">
                                <label for="lstCountry">Support Type <span class="required"> * </span></label>
                                <select class="form-control  {{$Theme['input-size']}} select2" id="lstSupportType" data-selected="<?php if($isEdit){echo $EditData[0]->CountryID;} ?>">
                                
                                </select>
                                <div class="errors" id="lstCountry-err"></div>
                            </div>
                        </div>
                        <div class="col-sm-6 mt-20">
                            <div class="form-group">
                                <label for="lstCountry">Priority<span class="required"> * </span></label>
                                <select class="form-control  {{$Theme['input-size']}} select2" id="lstSupportType" data-selected="<?php if($isEdit){echo $EditData[0]->CountryID;} ?>">
                                    <option value="Low">Low</option>
                                    <option value="Medium">Medium</option>
                                    <option value="High">High</option>
                                </select>
                                <div class="errors" id="lstCountry-err"></div>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label class="txtStateCode">Description</label>
                                <textarea class="form-control" name="" id="" rows="3"></textarea>
                                <div class="errors" id="txtStateCode-err"></div>
                            </div>
                        </div>
                        <div class="col-sm-4 mt-20">
                            <div class="form-group">
                                <label class="lstActiveStatus"> Attachment 1</label>
                                <input type="file" class="dropify imageScrop" data-aspect-ratio="{{$Settings['image-crop-ratio']['w']/$Settings['image-crop-ratio']['h']}}" data-remove="0" data-is-cover-image="1" id="txtVCImage" data-default-file="<?php if($isEdit==true){if($EditData[0]->VCImage!=""){ echo url('/')."/".$EditData[0]->VCImage;}}?>" >
                                <div class="errors" id="lstActiveStatus-err"></div>
                            </div>
                        </div>
                        <div class="col-sm-4 mt-20">
                            <div class="form-group">
                                <label class="lstActiveStatus"> Attachment 2</label>
                                <input type="file" class="dropify imageScrop" data-aspect-ratio="{{$Settings['image-crop-ratio']['w']/$Settings['image-crop-ratio']['h']}}" data-remove="0" data-is-cover-image="1" id="txtVCImage" data-default-file="<?php if($isEdit==true){if($EditData[0]->VCImage!=""){ echo url('/')."/".$EditData[0]->VCImage;}}?>" >
                                <div class="errors" id="lstActiveStatus-err"></div>
                            </div>
                        </div>
                        <div class="col-sm-4 mt-20">
                            <div class="form-group">
                                <label class="lstActiveStatus"> Attachment 3</label>
                                <input type="file" class="dropify imageScrop" data-aspect-ratio="{{$Settings['image-crop-ratio']['w']/$Settings['image-crop-ratio']['h']}}" data-remove="0" data-is-cover-image="1" id="txtVCImage" data-default-file="<?php if($isEdit==true){if($EditData[0]->VCImage!=""){ echo url('/')."/".$EditData[0]->VCImage;}}?>" >
                                <div class="errors" id="lstActiveStatus-err"></div>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-20">
                        <div class="col-sm-12 text-right">
                            @if($crud['view']==true)
                            <a href="{{url('/')}}/admin/master/general/states" class="btn {{$Theme['button-size']}} btn-outline-dark mr-10" id="btnCancel">Back</a>
                            @endif
                            
                            @if((($crud['add']==true) && ($isEdit==false))||(($crud['edit']==true) && ($isEdit==true)))
                                <button class="btn {{$Theme['button-size']}} btn-outline-success" id="btnSave">@if($isEdit==true) Update @else Save @endif</button>
                            @endif
                        </div>
                    </div>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection
@section('scripts')
<script>
    $(document).ready(function(){

        const getSupportType=()=>{
            $.ajax({
                type:"post",
                url:"{{url('/')}}/admin/support/get/support-type",
                headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') },
                dataType:"json",
                async:true,
                error:function(e, x, settings, exception){ajax_errors(e, x, settings, exception);},
                complete: function(e, x, settings, exception){},
                success:function(response){
                    $('#lstSupportType').select2('destroy');
                    $('#lstSupportType option').remove();
                    $('#lstSupportType').append('<option value="" selected>Select a Support Type</option>');
                    for(let Item of response){
                        let selected="";
                        $('#lstSupportType').append('<option '+selected+' value="'+Item.SupportType+'">'+Item.SupportType+' </option>');
                    }
                    $('#lstSupportType').select2();
                }
            });
        }
        const formValidation=()=>{
            $('.errors').html('');
            let status=true;
            let StateName=$('#txtStateName').val();
            let StateCode=$('#txtStateCode').val();
            let CountryID=$('#lstCountry').val();
            if(StateName==""){
                $('#txtStateName-err').html('The State Name is required.');status=false;
            }else if(StateName.length<3){
                $('#txtStateName-err').html('State Name must be greater than 3 characters');status=false;
            }else if(StateName.length>100){
                $('#txtStateName-err').html('State Name may not be greater than 100 characters');status=false;
            }
            if(StateCode==""){
                $('#lstStateCode-err').html('The State Code is required.');status=false;
            }
            if(CountryID==""){
                $('#lstCountry-err').html('The Country Name is required.');status=false;
            }
            if(status==false){$("html, body").animate({ scrollTop: 0 }, "slow");}
            return status;
        }
        $('#btnSave').click(function(){
            let status=formValidation();
            if(status){
                swal({
                    title: "Are you sure?",
                    text: "You want @if($isEdit==true)Update @else Save @endif this State!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-outline-success",
                    confirmButtonText: "Yes, @if($isEdit==true)Update @else Save @endif it!",
                    closeOnConfirm: false
                },function(){
                    swal.close();
                    btnLoading($('#btnSave'));
                    let postUrl=@if($isEdit==true) "{{url('/')}}/admin/master/general/states/edit/{{$EditData[0]->StateID}}"; @else "{{url('/')}}/admin/master/general/states/create"; @endif
                    let formData=new FormData();
                    formData.append('StateName',$('#txtStateName').val());
                    formData.append('StateCode',$('#txtStateCode').val());
                    formData.append('CountryID',$('#lstCountry').val());
                    formData.append('ActiveStatus',$('#lstActiveStatus').val());
                    $.ajax({
                        type:"post",
                        url:postUrl,
                        headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') },
                        data:formData,
                        cache: false,
                        processData: false,
                        contentType: false,
                        xhr: function() {
                            var xhr = new window.XMLHttpRequest();
                            xhr.upload.addEventListener("progress", function(evt) {
                                if (evt.lengthComputable) {
                                    var percentComplete = (evt.loaded / evt.total) * 100;
                                    percentComplete=parseFloat(percentComplete).toFixed(2);
                                    $('#divProcessText').html(percentComplete+'% Completed.<br> Please wait for until upload process complete.');
                                    //Do something with upload progress here
                                }
                            }, false);
                            return xhr;
                        },
                        beforeSend: function() {
                            ajaxIndicatorStart("Please wait Upload Process on going.");

                            var percentVal = '0%';
                            setTimeout(() => {
                            $('#divProcessText').html(percentVal+' Completed.<br> Please wait for until upload process complete.');
                            }, 100);
                        },
                        error:function(e, x, settings, exception){ajaxErrors(e, x, settings, exception);},
                        complete: function(e, x, settings, exception){btnReset($('#btnSave'));ajaxIndicatorStop();$("html, body").animate({ scrollTop: 0 }, "slow");},
                        success:function(response){
                            document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
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
                                        window.location.replace("{{url('/')}}/admin/master/general/states");
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
                                if(response['errors']!=undefined){
                                    $('.errors').html('');
                                    $.each( response['errors'], function( KeyName, KeyValue ) {
                                        var key=KeyName;
                                        if(key=="StateName"){$('#txtStateName-err').html(KeyValue);}
                                        if(key=="StateCode"){$('#txtStateCode-err').html(KeyValue);}
                                    });
                                }
                            }
                        }
                    });
                });
            }
        });
        getSupportType();
    });
</script>
@endsection