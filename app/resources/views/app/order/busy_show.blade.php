@extends('layouts.app')
@section('content')
    <style>
        select.minimal {
            background-image:
                linear-gradient(45deg, transparent 50%, gray 50%),
                linear-gradient(135deg, gray 50%, transparent 50%),
                linear-gradient(to right, #ccc, #ccc);
            background-position:
                calc(100% - 20px) calc(1em + 2px),
                calc(100% - 15px) calc(1em + 2px),
                calc(100% - 2.5em) 0.5em;
            background-size:
                5px 5px,
                5px 5px,
                1px 1.5em;
            background-repeat: no-repeat;
        }

        select.minimal:focus {
            background-image:
                linear-gradient(45deg, green 50%, transparent 50%),
                linear-gradient(135deg, transparent 50%, green 50%),
                linear-gradient(to right, #ccc, #ccc);
            background-position:
                calc(100% - 15px) 1em,
                calc(100% - 20px) 1em,
                calc(100% - 2.5em) 0.5em;
            background-size:
                5px 5px,
                5px 5px,
                1px 1.5em;
            background-repeat: no-repeat;
            border-color: green;
            outline: 0;
        }
    </style>
<div class="container-fluid">
	<div class="page-header">
		<div class="row">
			<div class="col-sm-12">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="{{ url('/') }}" data-original-title="" title=""><i class="f-16 fa fa-home"></i></a></li>
					<li class="breadcrumb-item"><a href="{{url('/')}}/admin/busy">Busy Orders</a></li>
                    <li class="breadcrumb-item">View</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row d-flex justify-content-center">
		<div class="col-8 col-sm-8 col-lg-8">
			<div class="card">
				<div class="card-header text-center"><h5 class="mt-10">Busy Bill - {{ $EditData->OrderNo ?? '' }}</h5></div>
				<div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="lstCOType"><b>Ordered No :</b></label>
                                <label>{{ $EditData->OrderNo ?? '' }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Ordered Date :</b></label>
                                <label>{{ $EditData->OrderDate ?? '' }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Customer Name :</b></label>
                                <label>{{ $EditData->CustomerName ?? '' }}</label>
                            </div>
                        </div>
{{--                        <div class="col-sm-12 mt-20">--}}
{{--                            <div class="form-group">--}}
{{--                                <label for="lstCOType"><b>Customer Email :</b></label>--}}
{{--                                <label>{{ $EditData->Email ?? '' }}</label>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                        <div class="col-sm-12 mt-20">--}}
{{--                            <div class="form-group">--}}
{{--                                <label for="lstCOType"><b>Customer Mobile :</b></label>--}}
{{--                                <label>{{ $EditData->MobileNo1 ?? '' }}</label>--}}
{{--                            </div>--}}
{{--                        </div>--}}
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Address :</b></label>
                                <label>{{ $EditData->CompleteAddress ?? '' }}</label>
                            </div>
                        </div>
{{--                        <div class="col-sm-12 mt-20">--}}
{{--                            <div class="form-group">--}}
{{--                                <label for="lstCOType"><b>Status :</b></label>--}}
{{--                                <label>{{ $EditData->Status ?? '' }}</label>--}}
{{--                            </div>--}}
{{--                        </div>--}}
{{--                        <div class="col-sm-12 mt-20">--}}
{{--                            <div class="form-group">--}}
{{--                                <label for="lstCOType"><b>Payment Status :</b></label>--}}
{{--                                <label>{{ $EditData->paymentStatus }}</label>--}}
{{--                            </div>--}}
{{--                        </div>--}}

{{--                        @if(($EditData->PaymentID))--}}
{{--                            <div class="col-sm-12 mt-20">--}}
{{--                                <div class="form-group">--}}
{{--                                    <label for="lstCOType"><b>Payment ID :</b></label>--}}
{{--                                    <label>{{ $EditData->PaymentID ?? '-' }}</label>--}}
{{--                                </div>--}}
{{--                            </div>--}}
                            <div class="col-sm-12 mt-20">
                                <div class="form-group">
                                    <label for="lstCOType"><b>Busy Sale ID :</b></label>
                                    <label>{{ $EditData->BusySaleID }}</label>
                                </div>
                            </div>
{{--                        @endif--}}

{{--                        <div class="row col-12">--}}
{{--                            <div class="col-sm-6 col-md-4 mt-20 {{ (!$EditData->PaymentID) ? 'd-none' : '' }}">--}}
{{--                                <div class="form-group">--}}
{{--                                    <label for="trackStatus"><b>Track status :</b></label>--}}
{{--                                    <label>{{ $EditData->TrackStatus }}</label>--}}
{{--                                </div>--}}
{{--                            </div>--}}
{{--                        </div>--}}
                        <div class="col-sm-12 mt-20">
                            <div class="table-responsive">
                            <table class="table table-sm no-footer dtr-inline" id="orderDetailsTable">
                                <thead>
                                <tr style="font-weight: 600;">
                                    <td>S.No</td>
                                    <td>Product Name</td>
                                    <td>Qty</td>
                                    <td style="width: 140px !important;">Rate</td>
                                    <td style="width: 140px !important;">Total</td>
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($EditData->orderDetails as $index=>$product)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td>{{ $product->ProductName ?? '-' }}</td>
                                        <td>{{ $product->Qty ?? '-' }}</td>
                                        <td>{{ $product->SRate ?? '-' }}</td>
                                        <td>{{ $product->Amount ?? '-' }}</td>
                                    </tr>
                                @endforeach
                                @php $colSpanValue = 4; @endphp
                                <tr>
                                    <td colspan="{{ $colSpanValue }}" class="text-end">Sub-Total :</td>
                                    <td>{{ $EditData->SubTotal ?? '-' }}</td>
                                </tr>
                                <tr>
                                    <td colspan="{{ $colSpanValue }}" class="text-end">Shipping Charge :</td>
                                    <td>{{ $EditData->ShippingCharge ?? '-' }}</td>
                                </tr>
                                <tr>
                                    <td colspan="{{ $colSpanValue }}" class="text-end">Discount :</td>
                                    <td>{{ $EditData->DiscountAmount ?? '-' }}</td>
                                </tr>
                                <tr>
                                    <td colspan="{{ $colSpanValue }}" class="text-end">Grand-Total :</td>
                                    <td>{{ $EditData->TotalAmountInString ?? '-' }}</td>
                                </tr>
                                </tbody>
                            </table>
                            </div>
                        </div>
                    </div>
				</div>
                <div class="card-footer">
                    <div class="row">
                        <div class="col-sm-12 text-right">
                            @if($crud['view'])
                            <a href="{{ URL::previous() }}" class="btn {{$Theme['button-size']}} btn-outline-dark mr-10" id="btnCancel">Back</a>
                            @endif
                        </div>
                    </div>
                </div>
			</div>
		</div>
	</div>
</div>
@endsection
{{--@section('scripts')--}}
{{--    @if($EditData->TrackStatus !== "Delivered")--}}
{{--        <script>--}}
{{--            $(document).ready(function () {--}}
{{--                var barcode = "";--}}
{{--                var interval;--}}

{{--                $(document).on('keydown', function (e) {--}}
{{--                    clearInterval(interval);--}}
{{--                    if (e.which === 13) {--}}
{{--                        if (barcode.length > 3) {--}}
{{--                            var activeElement = document.activeElement;--}}
{{--                            if (activeElement.tagName === "INPUT" && (activeElement.id === "courierName" || activeElement.id === "courierTrackNo")) {--}}
{{--                                var currentValue = $(activeElement).val();--}}
{{--                                if (currentValue.endsWith(barcode)) {--}}
{{--                                    $(activeElement).val(currentValue.slice(0, -barcode.length));--}}
{{--                                }--}}
{{--                            }--}}
{{--                            $('#hidden-barcode-input').val(barcode).trigger('input');--}}
{{--                        }--}}
{{--                        barcode = "";--}}
{{--                    } else {--}}
{{--                        if (e.key.length === 1) {--}}
{{--                            barcode += e.key;--}}
{{--                        }--}}
{{--                        interval = setTimeout(function () {--}}
{{--                            barcode = "";--}}
{{--                        }, 200);--}}
{{--                    }--}}
{{--                });--}}

{{--                $('#hidden-barcode-input').on('input', function () {--}}
{{--                    var inputSKU = $(this).val().trim();--}}
{{--                    var packedButton = $("button.addPacked[data-SKU='" + inputSKU + "']");--}}
{{--                    if (packedButton.length) {--}}
{{--                        if (packedButton.hasClass('btn-warning')) {--}}
{{--                            packedButton.removeClass('btn-warning').addClass('btn-success').text('Click to Remove').removeClass('addPacked').addClass('removePacked');--}}
{{--                            $("p.text-danger[data-SKU='" + packedButton.attr('data-SKU') + "']").addClass('d-none');--}}
{{--                        } else {--}}
{{--                            packedButton.removeClass('btn-success').addClass('btn-warning').text('Click to Add').removeClass('removePacked').addClass('addPacked');--}}
{{--                        }--}}
{{--                    }--}}
{{--                    $(this).val('');--}}
{{--                });--}}

{{--                const formValidation = async () => {--}}
{{--                    $('.errors').html('');--}}
{{--                    let status = true;--}}
{{--                    let courierName = $('#courierName').val();--}}
{{--                    let courierTrackNo = $('#courierTrackNo').val();--}}
{{--                    if (courierName === "") {--}}
{{--                        $('#courierName-err').html('The Courier name field is required.');--}}
{{--                        status = false;--}}
{{--                    }--}}
{{--                    if (courierTrackNo === "") {--}}
{{--                        $('#courierTrackNo-err').html('The Courier track no field is required.');--}}
{{--                        status = false;--}}
{{--                    }--}}

{{--                    $('.addPacked').each(function () {--}}
{{--                        $("p.text-danger[data-SKU='" + $(this).attr('data-SKU') + "']").removeClass('d-none');--}}
{{--                        status = false;--}}
{{--                    });--}}

{{--                    $('.removePacked').each(function () {--}}
{{--                        $("p.text-danger[data-SKU='" + $(this).attr('data-SKU') + "']").addClass('d-none');--}}
{{--                    });--}}

{{--                    if (status === false) {--}}
{{--                        $("html, body").animate({scrollTop: 0}, "slow");--}}
{{--                    }--}}
{{--                    return status;--}}
{{--                }--}}
{{--                const GetData = async () => {--}}
{{--                    let formData = new FormData();--}}
{{--                    formData.append('courierName', $('#courierName').val());--}}
{{--                    formData.append('courierTrackNo', $('#courierTrackNo').val());--}}

{{--                    return formData;--}}
{{--                }--}}
{{--                $('#btnSave').click(async function () {--}}
{{--                    $('#btnSave').blur();--}}
{{--                    let status = await formValidation();--}}
{{--                    if (status) {--}}
{{--                        swal({--}}
{{--                            title: "Are you sure?",--}}
{{--                            text: "You want Update this order status!",--}}
{{--                            type: "warning",--}}
{{--                            showCancelButton: true,--}}
{{--                            confirmButtonClass: "btn-outline-success",--}}
{{--                            confirmButtonText: "Yes, Update it!",--}}
{{--                            closeOnConfirm: false--}}
{{--                        }, async function () {--}}
{{--                            swal.close();--}}
{{--                            const formData = await GetData();--}}
{{--                            btnLoading($('#btnSave'));--}}
{{--                            let postUrl = @if($isEdit) "{{url('/')}}/admin/orders/edit/{{$EditData->OrderID}}";--}}
{{--                            @endif--}}
{{--                            $.ajax({--}}
{{--                                type: "post",--}}
{{--                                url: postUrl,--}}
{{--                                headers: {'X-CSRF-Token': "{{ csrf_token() }}"},--}}
{{--                                data: formData,--}}
{{--                                cache: false,--}}
{{--                                processData: false,--}}
{{--                                contentType: false,--}}
{{--                                xhr: function () {--}}
{{--                                    var xhr = new window.XMLHttpRequest();--}}
{{--                                    xhr.upload.addEventListener("progress", function (evt) {--}}
{{--                                        if (evt.lengthComputable) {--}}
{{--                                            var percentComplete = (evt.loaded / evt.total) * 100;--}}
{{--                                            percentComplete = parseFloat(percentComplete).toFixed(2);--}}
{{--                                            $('#divProcessText').html(percentComplete + '% Completed.<br> Please wait for until upload process complete.');--}}
{{--                                        }--}}
{{--                                    }, false);--}}
{{--                                    return xhr;--}}
{{--                                },--}}
{{--                                beforeSend: function () {--}}
{{--                                    ajaxIndicatorStart("Please wait Upload Process on going.");--}}

{{--                                    var percentVal = '0%';--}}
{{--                                    setTimeout(() => {--}}
{{--                                        $('#divProcessText').html(percentVal + ' Completed.<br> Please wait for until upload process complete.');--}}
{{--                                    }, 100);--}}
{{--                                },--}}
{{--                                error: function (e, x, settings, exception) {--}}
{{--                                    ajaxErrors(e, x, settings, exception);--}}
{{--                                },--}}
{{--                                complete: function (e, x, settings, exception) {--}}
{{--                                    btnReset($('#btnSave'));--}}
{{--                                    ajaxIndicatorStop();--}}
{{--                                    $("html, body").animate({scrollTop: 0}, "slow");--}}
{{--                                },--}}
{{--                                success: function (response) {--}}
{{--                                    if (response.status === true) {--}}
{{--                                        swal({--}}
{{--                                            title: "SUCCESS",--}}
{{--                                            text: response.message,--}}
{{--                                            type: "success",--}}
{{--                                            showCancelButton: false,--}}
{{--                                            confirmButtonClass: "btn-outline-success",--}}
{{--                                            confirmButtonText: "Okay",--}}
{{--                                            closeOnConfirm: false--}}
{{--                                        }, function () {--}}
{{--                                            @if($isEdit)--}}
{{--                                            window.location.replace("{{url('/')}}/admin/orders");--}}
{{--                                            @else--}}
{{--                                            window.location.reload();--}}
{{--                                            @endif--}}
{{--                                        });--}}

{{--                                    } else {--}}
{{--                                        toastr.error(response.message, "Failed", {--}}
{{--                                            positionClass: "toast-top-right",--}}
{{--                                            containerId: "toast-top-right",--}}
{{--                                            showMethod: "slideDown",--}}
{{--                                            hideMethod: "slideUp",--}}
{{--                                            progressBar: !0--}}
{{--                                        })--}}
{{--                                        if (response['errors'] !== undefined) {--}}
{{--                                            $('.errors').html('');--}}
{{--                                            $.each(response['errors'], function (KeyName, KeyValue) {--}}
{{--                                                var key = KeyName;--}}
{{--                                                if (key === "type") {--}}
{{--                                                    $('#courierName-err').html(KeyValue);--}}
{{--                                                    $('#courierTrackNo-err').html(KeyValue);--}}
{{--                                                }--}}
{{--                                                if (key === "value") {--}}
{{--                                                    $('#courierName-err').html(KeyValue);--}}
{{--                                                    $('#courierTrackNo-err').html(KeyValue);--}}
{{--                                                }--}}
{{--                                            });--}}
{{--                                        }--}}
{{--                                    }--}}
{{--                                }--}}
{{--                            });--}}
{{--                        });--}}
{{--                    }--}}
{{--                });--}}

{{--                $(document).on('click', 'button.addPacked, button.removePacked', function () {--}}
{{--                    var $btn = $(this);--}}
{{--                    if ($btn.hasClass('btn-warning')) {--}}
{{--                        $btn.removeClass('btn-warning').addClass('btn-success').text('Click to Remove').removeClass('addPacked').addClass('removePacked').blur();--}}
{{--                        $("p.text-danger[data-SKU='" + $btn.attr('data-SKU') + "']").addClass('d-none');--}}
{{--                    } else {--}}
{{--                        $btn.removeClass('btn-success').addClass('btn-warning').text('Click to Add').removeClass('removePacked').addClass('addPacked').blur();--}}
{{--                    }--}}
{{--                });--}}
{{--            });--}}
{{--        </script>--}}
{{--    @endif--}}
{{--@endsection--}}
