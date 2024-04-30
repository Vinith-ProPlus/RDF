@extends('layouts.app')
@section('content')
<div class="container-fluid">
	<div class="page-header">
		<div class="row">
			<div class="col-sm-12">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="{{ url('/') }}" data-original-title="" title=""><i class="f-16 fa fa-home"></i></a></li>
{{--					<li class="breadcrumb-item">Orders</li>--}}
					<li class="breadcrumb-item"><a href="{{url('/')}}/admin/orders">{{$PageTitle}}</a></li>
                    <li class="breadcrumb-item">Update</li>
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
				<div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="lstCOType"><b>Ordered Date :</b></label>
                                <label>{{ $EditData[0]->OrderDate }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Customer Name :</b></label>
                                <label>{{ $EditData[0]->CustomerName }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Customer Email :</b></label>
                                <label>{{ $EditData[0]->Email }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Customer Mobile :</b></label>
                                <label>{{ $EditData[0]->MobileNo1 }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Address :</b></label>
                                <label>{{ $EditData[0]->CompleteAddress }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Status :</b></label>
                                <label>{{ $EditData[0]->Status }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Payment ID :</b></label>
                                <label>{{ $EditData[0]->PaymentID ?? '-' }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Payment Status :</b></label>
                                <label>{{ $EditData[0]->paymentStatus }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20 {{ (!$EditData[0]->PaymentID) ? 'd-none' : '' }}">
                            <div class="form-group">
                                <label for="trackStatus"><b>Track status <span class="required"> * </span></b></label>
                                <select class="form-control {{$Theme['input-size']}}" id="trackStatus">
                                    <option value="Order Confirmed" @if($isEdit==true) @if($EditData[0]->type=="Order Confirmed") selected @endif @endif @if(in_array($EditData[0]->TrackStatus, ["Shipped", "Out To Delivery", "Delivery Expected On", "Delivered"]))
                                        disabled
                                        @endif>Order Confirmed</option>
                                    <option value="Shipped" @if($isEdit==true) @if($EditData[0]->TrackStatus=="Shipped") selected @endif @endif @if(in_array($EditData[0]->TrackStatus, ["Out To Delivery", "Delivery Expected On", "Delivered"]))
                                        disabled
                                        @endif>Shipped</option>
                                    <option value="Out To Delivery" @if($isEdit==true) @if($EditData[0]->TrackStatus=="Out To Delivery") selected @endif @endif @if(in_array($EditData[0]->TrackStatus, ["Delivery Expected On", "Delivered"]))
                                        disabled
                                        @endif>Out To Delivery</option>
                                    <option value="Delivery Expected On" @if($isEdit==true) @if($EditData[0]->TrackStatus=="Delivery Expected On") selected @endif @endif @if(in_array($EditData[0]->TrackStatus, ["Delivered"]))
                                        disabled
                                        @endif>Delivery Expected On</option>
                                    <option value="Delivered" @if($isEdit==true) @if($EditData[0]->TrackStatus=="Delivered") selected @endif @endif>Delivered</option>
                                </select>
                                <div class="errors" id="trackStatus-err"></div>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <table class="table table-sm no-footer dtr-inline">
                                <thead>
                                <tr>
                                    <td>S.No</td>
                                    <td>Product Image</td>
                                    <td>Product Name</td>
                                    <td>Qty</td>
                                    <td style="width: 140px !important;">Rate</td>
                                    <td style="width: 140px !important;">Total</td>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($EditData[0]->orderDetails as $index=>$product)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td><img src="{{ $product->productImageUrl ?? '-' }}" width="150" height="150"></td>
                                        <td>{{ $product->ProductName ?? '-' }}</td>
                                        <td>{{ $product->Qty ?? '-' }}</td>
                                        <td>{{ $product->SRate ?? '-' }}</td>
                                        <td>{{ $product->Amount ?? '-' }}</td>
                                    </tr>
                                @endforeach
                                <tr>
                                    <td colspan="5" class="text-end">Sub-Total :</td>
                                    <td>{{ $EditData[0]->SubTotal ?? '-' }}</td>
                                </tr>
                                <tr>
                                    <td colspan="5" class="text-end">Shipping Charge :</td>
                                    <td>{{ $EditData[0]->ShippingCharge ?? '-' }}</td>
                                </tr>
                                <tr>
                                    <td colspan="5" class="text-end">Discount :</td>
                                    <td>{{ $EditData[0]->DiscountAmount ?? '-' }}</td>
                                </tr>
                                <tr>
                                    <td colspan="5" class="text-end">Grand-Total :</td>
                                    <td>{{ $EditData[0]->TotalAmountInString ?? '-' }}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
				</div>
                <div class="card-footer">
                    <div class="row">
                        <div class="col-sm-12 text-right">
                            @if($crud['view']==true)
                            <a href="{{url('/')}}/admin/orders/" class="btn {{$Theme['button-size']}} btn-outline-dark mr-10" id="btnCancel">Back</a>
                            @endif

                            @if((($crud['add']==true) && ($isEdit==false))||(($crud['edit']==true) && ($isEdit==true)))
                                <button class="btn {{$Theme['button-size']}} btn-outline-success btn-air-success {{ (!$EditData[0]->PaymentID) ? 'd-none' : '' }}" id="btnSave">@if($isEdit==true) Update @endif</button>
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
            let trackStatus=$('#trackStatus').val();

            if (status === false) {
                $("html, body").animate({ scrollTop: 0 }, "slow");
            }
            if(status===false){$("html, body").animate({ scrollTop: 0 }, "slow");}
            return status;
        }
        const GetData = async () => {
            let formData = new FormData();
            formData.append('TrackStatus', $('#trackStatus').val());
            return formData;
        }
        $('#btnSave').click(async function(){
            let status=await formValidation();
            if(status){
                swal({
                    title: "Are you sure?",
                    text: "You want Update this order status!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-outline-success",
                    confirmButtonText: "Yes, Update it!",
                    closeOnConfirm: false
                },async function(){
                    swal.close();
                    const formData=await GetData();
                    btnLoading($('#btnSave'));
                    let postUrl= @if($isEdit) "{{url('/')}}/admin/orders/edit/{{$EditData[0]->OrderID}}";@endif
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
                                        window.location.replace("{{url('/')}}/admin/orders");
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
