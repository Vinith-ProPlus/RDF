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
        thead td {
            font-weight: bold;
        }
    </style>
<div class="container-fluid">
	<div class="page-header">
		<div class="row">
			<div class="col-sm-12">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="{{ url('/') }}" data-original-title="" title=""><i class="f-16 fa fa-home"></i></a></li>
					<li class="breadcrumb-item"><a href="{{url('/')}}/admin/orders">{{$PageTitle}}</a></li>
                    <li class="breadcrumb-item">{{ ($EditData[0]->TrackStatus === "Order Confirmed") ? 'Update' : 'View' }}</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row d-flex justify-content-center">
		<div class="col-12 col-sm-12 col-lg-12">
			<div class="card">
				<div class="card-header text-center"><h5 class="mt-10">{{$PageTitle}}</h5></div>
				<div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="lstCOType"><b>Ordered No :</b></label>
                                <label>{{ $EditData[0]->OrderNo ?? '' }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Ordered Date :</b></label>
                                <label>{{ $EditData[0]->OrderDate ?? '' }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Customer Name :</b></label>
                                <label>{{ $EditData[0]->CustomerName ?? '' }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Customer Email :</b></label>
                                <label>{{ $EditData[0]->Email ?? '' }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Customer Mobile :</b></label>
                                <label>{{ $EditData[0]->MobileNo1 ?? '' }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Address :</b></label>
                                <label>{{ $EditData[0]->CompleteAddress ?? '' }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Status :</b></label>
                                <label>{{ $EditData[0]->Status ?? '' }}</label>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label for="lstCOType"><b>Payment Status :</b></label>
                                <label>{{ $EditData[0]->paymentStatus }}</label>
                            </div>
                        </div>

                        @if(($EditData[0]->PaymentID))
                            <div class="col-sm-12 mt-20">
                                <div class="form-group">
                                    <label for="lstCOType"><b>Payment ID :</b></label>
                                    <label>{{ $EditData[0]->PaymentID ?? '-' }}</label>
                                </div>
                            </div>
                            <div class="col-sm-12 mt-20">
                                <div class="form-group">
                                    <label for="lstCOType"><b>Busy Sale ID :</b></label>
                                    <label>{{ $EditData[0]->BusySaleID ?? 'Not Updated' }}</label>
                                </div>
                            </div>
                        @endif

                        <div class="row col-12">
                            <div class="col-sm-6 col-md-4 mt-20 {{ (!$EditData[0]->PaymentID) ? 'd-none' : '' }}">
                                <div class="form-group">
                                    <label for="trackStatus"><b>Track status :</b></label>
                                    <label>{{ $EditData[0]->TrackStatus }}</label>
                                </div>
                            </div>
                        </div>
                        @if($EditData[0]->TrackStatus === "Delivered")
                            <div class="row col-12">
                                <div class="col-sm-6 col-md-4 mt-20">
                                    <div class="form-group">
                                        <label><b>Courier Name :</b></label>
                                        <label>{{ $EditData[0]->courierName ?? '' }}</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row col-12">
                                <div class="col-sm-6 col-md-4 mt-20">
                                    <div class="form-group">
                                        <label><b>Courier Track No :</b></label>
                                        <label>{{ $EditData[0]->courierTrackNo ?? '' }}</label>
                                    </div>
                                </div>
                            </div>
                        @elseif($EditData[0]->TrackStatus === "Order Confirmed")
                            <div class="row col-12" id="courierDetailsDiv">
                                <div class="col-sm-6 col-md-4">
                                    <div class="form-group mt-20">
                                        <label for="courierName"><b>Courier Name :<span
                                                    class="required"> * </span></b></label>
                                        <input type="text" class="form-control" id="courierName"
                                               value="{{ $EditData[0]->courierName ?? '' }}" autocomplete="off">
                                        <div class="errors" id="courierName-err"></div>
                                    </div>
                                    <div class="form-group mt-20">
                                        <label for="courierTrackNo"><b>Courier Track No :<span
                                                    class="required"> * </span></b></label>
                                        <input type="text" class="form-control" id="courierTrackNo"
                                               value="{{ $EditData[0]->courierTrackNo ?? '' }}" autocomplete="off">
                                        <div class="errors" id="courierTrackNo-err"></div>
                                    </div>
                                </div>
                                <input type="hidden" id="hidden-barcode-input" style="position: absolute; top: -9999px;">
                            </div>
                        @endif
                        <div class="col-sm-12 mt-20">
                            <div class="table-responsive">
                            <table class="table table-sm no-footer dtr-inline" id="orderDetailsTable">
                                <thead>
                                <tr class="bold">
                                    <td>S.No</td>
                                    <td>Product Image</td>
                                    <td>Product Name</td>
                                    <td>Qty</td>
                                    <td style="width: 140px !important;">Rate</td>
                                    <td style="width: 140px !important;">Total</td>
                                    @if($EditData[0]->TrackStatus === "Order Confirmed")
                                        <td style="width: 150px !important;">Packing Status</td>
                                    @endif
                                </tr>
                                </thead>
                                <tbody>
                                @foreach($EditData[0]->orderDetails as $index=>$product)
                                    <tr>
                                        <td>{{ $index + 1 }}</td>
                                        <td><img src="{{ $product->productImageUrl ?? '-' }}" width="150" height="150" alt="Product Image"></td>
                                        <td>{{ $product->ProductName ?? '-' }} - {{ $product->Unit ?? '-' }}</td>
                                        <td>{{ $product->Qty ?? '-' }}</td>
                                        <td>{{ $product->SRate ?? '-' }}</td>
                                        <td>{{ $product->Amount ?? '-' }}</td>
                                        @if($EditData[0]->TrackStatus === "Order Confirmed")
                                            <td>
                                                <button type="button"
                                                        class="btn btn-warning btn-sm-warning mr-10 addPacked"
                                                        data-SKU="{{ $product->SKU ?? '' }}">Click to Add
                                                </button>
                                                <p class="text-danger fw-bold d-none"
                                                   data-SKU="{{ $product->SKU ?? '' }}">Need to be packed</p>
                                            </td>
                                        @endif
                                    </tr>
                                @endforeach
                                @php $colSpanValue = ($EditData[0]->TrackStatus === "Order Confirmed") ? 6 : 5; @endphp
                                <tr>
                                    <td colspan="{{ $colSpanValue }}" class="text-end">Sub-Total :</td>
                                    <td>{{ $EditData[0]->SubTotal ?? '-' }}</td>
                                </tr>
                                <tr>
                                    <td colspan="{{ $colSpanValue }}" class="text-end">Shipping Charge :</td>
                                    <td>{{ $EditData[0]->ShippingCharge ?? '-' }}</td>
                                </tr>
                                <tr>
                                    <td colspan="{{ $colSpanValue }}" class="text-end">Discount :</td>
                                    <td>{{ $EditData[0]->DiscountAmount ?? '-' }}</td>
                                </tr>
                                <tr>
                                    <td colspan="{{ $colSpanValue }}" class="text-end">Grand-Total :</td>
                                    <td>{{ $EditData[0]->TotalAmountInString ?? '-' }}</td>
                                </tr>
                                </tbody>
                            </table>
                            </div>

                            <div class="row col-sm-12 text-center">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-8 mt-20 text-center">
                                    <div class="text-center"><h6>Tax Details</h6></div>
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>Tax Percentage</th>
                                            <?php
                                            $hasSGST = $hasCGST = $hasIGST = false;

                                            foreach ($EditData[0]->taxes as $taxDetails) {
                                                if (isset($taxDetails['SGST'])) $hasSGST = true;
                                                if (isset($taxDetails['CGST'])) $hasCGST = true;
                                                if (isset($taxDetails['IGST'])) $hasIGST = true;
                                            }

                                            if ($hasSGST) echo "<th>SGST</th>";
                                            if ($hasCGST) echo "<th>CGST</th>";
                                            if ($hasIGST) echo "<th>IGST</th>";
                                            ?>
                                            <th>Total</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php
                                        $totals = ['SGST' => 0, 'CGST' => 0, 'IGST' => 0, 'Total' => 0];

                                        foreach ($EditData[0]->taxes as $taxPercentage => $taxDetails) {
                                            $sgst = isset($taxDetails['SGST']) ? round($taxDetails['SGST'],2) : 0;
                                            $cgst = isset($taxDetails['CGST']) ? round($taxDetails['CGST'],2) : 0;
                                            $igst = isset($taxDetails['IGST']) ? round($taxDetails['IGST'],2) : 0;
                                            $total = isset($taxDetails['Total']) ? round($taxDetails['Total'],2) : 0;

                                            $totals['SGST'] += $sgst;
                                            $totals['CGST'] += $cgst;
                                            $totals['IGST'] += $igst;
                                            $totals['Total'] += $total;

                                            echo "<tr>";
                                            echo "<td>{$taxPercentage}</td>";
                                            if ($hasSGST) echo "<td>" . ($sgst > 0 ? "₹ " . number_format($sgst, 2) : '-') . "</td>";
                                            if ($hasCGST) echo "<td>" . ($cgst > 0 ? "₹ " . number_format($cgst, 2) : '-') . "</td>";
                                            if ($hasIGST) echo "<td>" . ($igst > 0 ? "₹ " . number_format($igst, 2) : '-') . "</td>";
                                            echo "<td>" . ($total > 0 ? "₹ " . number_format($total, 2) : '-') . "</td>";
                                            echo "</tr>";
                                        }
                                        ?>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Total</th>
                                            <?php
                                            if ($hasSGST) echo "<th>" . ($totals['SGST'] > 0 ? "₹ " . number_format($totals['SGST'], 2) : '-') . "</th>";
                                            if ($hasCGST) echo "<th>" . ($totals['CGST'] > 0 ? "₹ " . number_format($totals['CGST'], 2) : '-') . "</th>";
                                            if ($hasIGST) echo "<th>" . ($totals['IGST'] > 0 ? "₹ " . number_format($totals['IGST'], 2) : '-') . "</th>";
                                            ?>
                                            <th><?php echo $totals['Total'] > 0 ? "₹ " . number_format($totals['Total'], 2) : '₹ 0.00'; ?></th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="col-sm-2"></div>
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
                                @if($EditData[0]->TrackStatus === "Order Confirmed")
                                    @if(($crud['add'] && (!$isEdit))||(($crud['edit']) && ($isEdit)))
                                        <button
                                            class="btn {{$Theme['button-size']}} btn-outline-success btn-air-success {{ (!$EditData[0]->PaymentID) ? 'd-none' : '' }}"
                                            id="btnSave">@if($isEdit)
                                                Update
                                            @endif</button>
                                    @endif
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
    @if($EditData[0]->TrackStatus !== "Delivered")
        <script>
            $(document).ready(function () {
                var barcode = "";
                var interval;

                $(document).on('keydown', function (e) {
                    clearInterval(interval);
                    if (e.which === 13) {
                        if (barcode.length > 3) {
                            var activeElement = document.activeElement;
                            if (activeElement.tagName === "INPUT" && (activeElement.id === "courierName" || activeElement.id === "courierTrackNo")) {
                                var currentValue = $(activeElement).val();
                                if (currentValue.endsWith(barcode)) {
                                    $(activeElement).val(currentValue.slice(0, -barcode.length));
                                }
                            }
                            $('#hidden-barcode-input').val(barcode).trigger('input');
                        }
                        barcode = "";
                    } else {
                        if (e.key.length === 1) {
                            barcode += e.key;
                        }
                        interval = setTimeout(function () {
                            barcode = "";
                        }, 200);
                    }
                });

                $('#hidden-barcode-input').on('input', function () {
                    var inputSKU = $(this).val().trim();
                    var packedButton = $("button.addPacked[data-SKU='" + inputSKU + "']");
                    if (packedButton.length) {
                        if (packedButton.hasClass('btn-warning')) {
                            packedButton.removeClass('btn-warning').addClass('btn-success').text('Click to Remove').removeClass('addPacked').addClass('removePacked');
                            $("p.text-danger[data-SKU='" + packedButton.attr('data-SKU') + "']").addClass('d-none');
                        } else {
                            packedButton.removeClass('btn-success').addClass('btn-warning').text('Click to Add').removeClass('removePacked').addClass('addPacked');
                        }
                    }
                    $(this).val('');
                });

                const formValidation = async () => {
                    $('.errors').html('');
                    let status = true;
                    let courierName = $('#courierName').val();
                    let courierTrackNo = $('#courierTrackNo').val();
                    if (courierName === "") {
                        $('#courierName-err').html('The Courier name field is required.');
                        status = false;
                    }
                    if (courierTrackNo === "") {
                        $('#courierTrackNo-err').html('The Courier track no field is required.');
                        status = false;
                    }

                    $('.addPacked').each(function () {
                        $("p.text-danger[data-SKU='" + $(this).attr('data-SKU') + "']").removeClass('d-none');
                        status = false;
                    });

                    $('.removePacked').each(function () {
                        $("p.text-danger[data-SKU='" + $(this).attr('data-SKU') + "']").addClass('d-none');
                    });

                    if (status === false) {
                        $("html, body").animate({scrollTop: 0}, "slow");
                    }
                    return status;
                }
                const GetData = async () => {
                    let formData = new FormData();
                    formData.append('courierName', $('#courierName').val());
                    formData.append('courierTrackNo', $('#courierTrackNo').val());

                    return formData;
                }
                $('#btnSave').click(async function () {
                    $('#btnSave').blur();
                    let status = await formValidation();
                    if (status) {
                        swal({
                            title: "Are you sure?",
                            text: "You want Update this order status!",
                            type: "warning",
                            showCancelButton: true,
                            confirmButtonClass: "btn-outline-success",
                            confirmButtonText: "Yes, Update it!",
                            closeOnConfirm: false
                        }, async function () {
                            swal.close();
                            const formData = await GetData();
                            btnLoading($('#btnSave'));
                            let postUrl = @if($isEdit) "{{url('/')}}/admin/orders/edit/{{$EditData[0]->OrderID}}";
                            @endif
                            $.ajax({
                                type: "post",
                                url: postUrl,
                                headers: {'X-CSRF-Token': "{{ csrf_token() }}"},
                                data: formData,
                                cache: false,
                                processData: false,
                                contentType: false,
                                xhr: function () {
                                    var xhr = new window.XMLHttpRequest();
                                    xhr.upload.addEventListener("progress", function (evt) {
                                        if (evt.lengthComputable) {
                                            var percentComplete = (evt.loaded / evt.total) * 100;
                                            percentComplete = parseFloat(percentComplete).toFixed(2);
                                            $('#divProcessText').html(percentComplete + '% Completed.<br> Please wait for until upload process complete.');
                                        }
                                    }, false);
                                    return xhr;
                                },
                                beforeSend: function () {
                                    ajaxIndicatorStart("Please wait Upload Process on going.");

                                    var percentVal = '0%';
                                    setTimeout(() => {
                                        $('#divProcessText').html(percentVal + ' Completed.<br> Please wait for until upload process complete.');
                                    }, 100);
                                },
                                error: function (e, x, settings, exception) {
                                    ajaxErrors(e, x, settings, exception);
                                },
                                complete: function (e, x, settings, exception) {
                                    btnReset($('#btnSave'));
                                    ajaxIndicatorStop();
                                    $("html, body").animate({scrollTop: 0}, "slow");
                                },
                                success: function (response) {
                                    if (response.status === true) {
                                        swal({
                                            title: "SUCCESS",
                                            text: response.message,
                                            type: "success",
                                            showCancelButton: false,
                                            confirmButtonClass: "btn-outline-success",
                                            confirmButtonText: "Okay",
                                            closeOnConfirm: false
                                        }, function () {
                                            @if($isEdit)
                                            window.location.replace("{{url('/')}}/admin/orders");
                                            @else
                                            window.location.reload();
                                            @endif
                                        });

                                    } else {
                                        toastr.error(response.message, "Failed", {
                                            positionClass: "toast-top-right",
                                            containerId: "toast-top-right",
                                            showMethod: "slideDown",
                                            hideMethod: "slideUp",
                                            progressBar: !0
                                        })
                                        if (response['errors'] !== undefined) {
                                            $('.errors').html('');
                                            $.each(response['errors'], function (KeyName, KeyValue) {
                                                var key = KeyName;
                                                if (key === "type") {
                                                    $('#courierName-err').html(KeyValue);
                                                    $('#courierTrackNo-err').html(KeyValue);
                                                }
                                                if (key === "value") {
                                                    $('#courierName-err').html(KeyValue);
                                                    $('#courierTrackNo-err').html(KeyValue);
                                                }
                                            });
                                        }
                                    }
                                }
                            });
                        });
                    }
                });

                $(document).on('click', 'button.addPacked, button.removePacked', function () {
                    var $btn = $(this);
                    if ($btn.hasClass('btn-warning')) {
                        $btn.removeClass('btn-warning').addClass('btn-success').text('Click to Remove').removeClass('addPacked').addClass('removePacked').blur();
                        $("p.text-danger[data-SKU='" + $btn.attr('data-SKU') + "']").addClass('d-none');
                    } else {
                        $btn.removeClass('btn-success').addClass('btn-warning').text('Click to Add').removeClass('removePacked').addClass('addPacked').blur();
                    }
                });
            });
        </script>
    @endif
@endsection
