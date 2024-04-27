@extends('layouts.app')
@section('content')
<div class="container-fluid">
	<div class="page-header">
		<div class="row">
			<div class="col-sm-12">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="{{ url('/') }}" data-original-title="" title=""><i class="f-16 fa fa-home"></i></a></li>
					<li class="breadcrumb-item">Product Master</li>
					<li class="breadcrumb-item"><a href="{{url('/')}}/admin/master/product/coupon">{{$PageTitle}}</a></li>
                    <li class="breadcrumb-item">@if($isEdit==true)Update @else Create @endif</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row d-flex justify-content-center">
		<div class="col-12 col-sm-12 col-lg-6">
			<div class="card">
				<div class="card-header text-center"><h5 class="mt-10">{{$PageTitle}}</h5></div>
				<div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="lstCOType">Coupon Type <span class="required"> * </span></label>
                                <select class="form-control {{$Theme['input-size']}}" id="lstCOType">
                                    <option value="Percentage" @if($isEdit==true) @if($EditData[0]->type=="Percentage") selected @endif @endif >Percentage</option>
                                    <option value="Amount" @if($isEdit==true) @if($EditData[0]->type=="Amount") selected @endif @endif>Amount</option>
                                </select>
                                <div class="errors" id="lstCOType-err"></div>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="txtCOValue">Coupon Value <span class="required"> * </span></label>
                                <input type="number" class="form-control {{$Theme['input-size']}}" id="txtCOValue" value="{{ $isEdit==true ? ($EditData[0]->value ?? '') : '' }}" autocomplete="off">
                                <div class="errors" id="txtCOValue-err"></div>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label class="lstActiveStatus"> Active Status</label>
                                <select class="form-control {{$Theme['input-size']}}" id="lstActiveStatus">
                                    <option value="Active" @if($isEdit==true) @if($EditData[0]->ActiveStatus=="Active") selected @endif @endif >Active</option>
                                    <option value="Inactive" @if($isEdit==true) @if($EditData[0]->ActiveStatus=="Inactive") selected @endif @endif>Inactive</option>
                                </select>
                                <div class="errors" id="lstActiveStatus-err"></div>
                            </div>
                        </div>
                    </div>
				</div>
                <div class="card-footer">
                    <div class="row">
                        <div class="col-sm-12 text-right">
                            @if($crud['view']==true)
                            <a href="{{url('/')}}/admin/master/product/coupon/" class="btn {{$Theme['button-size']}} btn-outline-dark mr-10" id="btnCancel">Back</a>
                            @endif

                            @if((($crud['add']==true) && ($isEdit==false))||(($crud['edit']==true) && ($isEdit==true)))
                                <button class="btn {{$Theme['button-size']}} btn-outline-success btn-air-success" id="btnSave">@if($isEdit==true) Update @else Save @endif</button>
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
        const formValidation=async()=>{
            $('.errors').html('');
            let status=true;
            let COType=$('#lstCOType').val();
            let COValue=$('#txtCOValue').val();
            if (COValue === "") {
                $('#txtCOValue-err').html('The Coupon Value is required.');
                status = false;
            } else if (COValue === 0) {
                $('#txtCOValue-err').html('Coupon Value must be greater than 0');
                status = false;
            } else if (COType === 'Percentage' && (COValue < 0 || COValue > 100)) {
                $('#txtCOValue-err').html('Coupon Value must be between 0 and 100 for percentage type.');
                status = false;
            } else if (COType === 'Amount' && COValue <= 0) {
                $('#txtCOValue-err').html('Coupon Value must be greater than 0 for amount type.');
                status = false;
            }

            if (status === false) {
                $("html, body").animate({ scrollTop: 0 }, "slow");
            }
            if(status===false){$("html, body").animate({ scrollTop: 0 }, "slow");}
            return status;
        }
        const GetData = async () => {
            let formData = new FormData();
            formData.append('type', $('#lstCOType').val());
            formData.append('value', $('#txtCOValue').val());
            formData.append('ActiveStatus', $('#lstActiveStatus').val());
            return formData;
        }
        $('#btnSave').click(async function(){
            let status=await formValidation();
            if(status){
                swal({
                    title: "Are you sure?",
                    text: "You want @if($isEdit==true)Update @else Save @endif this Coupon!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-outline-success",
                    confirmButtonText: "Yes, @if($isEdit==true)Update @else Save @endif it!",
                    closeOnConfirm: false
                },async function(){
                    swal.close();
                    const formData=await GetData();
                    btnLoading($('#btnSave'));
                    let postUrl= @if($isEdit) "{{url('/')}}/admin/master/product/coupon/edit/{{$EditData[0]->COID}}"; @else "{{url('/')}}/admin/master/product/coupon/create"; @endif
                    $.ajax({
                        type:"post",
                        url:postUrl,
                        headers: { 'X-CSRF-Token' : "{{ csrf_token() }}" },
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
                            if(response.status===true){
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
                                        window.location.replace("{{url('/')}}/admin/master/product/coupon");
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
                                if(response['errors']!==undefined){
                                    $('.errors').html('');
                                    $.each( response['errors'], function( KeyName, KeyValue ) {
                                        var key=KeyName;
                                        if(key==="type"){$('#lstCOType-err').html(KeyValue);}
                                        if(key==="value"){$('#txtCOValue-err').html(KeyValue);}
                                    });
                                }
                            }
                        }
                    });
                });
            }
        });
    });
</script>
@endsection
