@extends('layouts.app')
@section('content')
<style>
    .stamp-badge {
    padding: 3px 6px;
    margin: -10px;
    z-index: 1;
}
</style>
<div class="container-fluid">
	<div class="page-header">
		<div class="row">
			<div class="col-sm-12">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="{{ url('/') }}" data-original-title="" title=""><i class="f-16 fa fa-home"></i></a></li>
					<li class="breadcrumb-item">Transaction</li>
					<li class="breadcrumb-item"><a href="{{ url('/') }}/admin/transaction/quote-enquiry/" data-original-title="" title="">{{$PageTitle}}</a></li>
                    <li class="breadcrumb-item">Quote View</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row d-flex justify-content-center">
		<div class="col-12 col-sm-12 col-lg-12">
			<div class="card">
				<div class="card-header text-center"><h5 class="mt-10">Quote Enquiry ( {{$EnqData->EnqNo}} )</h5></div>
				<div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="row justify-content-center">
                                <div class="col-sm-4">
                                    <div class="card">
                                        <div class="card-header p-6">
                                            <p class="text-center fs-16 fw-500">Contact Info</p>
                                        </div>
                                        <div class="card-body">
                                            @foreach([
                                                'Customer Name' => $EnqData->ReceiverName,
                                                'Email' => $EnqData->Email,
                                                'Contact Number' => $EnqData->ReceiverMobNo ,
                                                'Quote Enquiry Date' => date($Settings['DATE-FORMAT'], strtotime($EnqData->EnqDate)),
                                            ] as $label => $value)
                                                <div class="row my-1">
                                                    <div class="col-sm-5 fw-600">{{ $label }}</div>
                                                    <div class="col-sm-1 fw-600 text-center">:</div>
                                                    <div class="col-sm-6">{{ $value }}</div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="card">
                                        <div class="card-header p-6">
                                            <p class="text-center fs-16 fw-500">Billing Address</p>
                                        </div>
                                        <div class="card-body">
                                            <?php 
                                                $Address="";
                                                // if($EnqData->CustomerName!=""){$Address.="<b>".$EnqData->CustomerName."</b>";}
                                                if($EnqData->Address!=""){if($Address!=""){$Address.=",<br> ";}$Address.=$EnqData->Address;}
                                                if($EnqData->CityName!=""){if($Address!=""){$Address.=",<br> ";}$Address.=$EnqData->CityName;}
                                                if($EnqData->TalukName!=""){if($Address!=""){$Address.=",<br> ";}$Address.=$EnqData->TalukName;}
                                                if($EnqData->DistrictName!=""){if($Address!=""){$Address.=",<br> ";}$Address.=$EnqData->DistrictName;}
                                                if($EnqData->StateName!=""){if($Address!=""){$Address.=",<br>";}$Address.=$EnqData->StateName;}
                                                if($EnqData->CountryName!=""){if($Address!=""){$Address.=", ";}$Address.=$EnqData->CountryName;}
                                                if($EnqData->PostalCode!=""){if($Address!=""){$Address.=" - ";}$Address.=$EnqData->PostalCode;}
                                                if($Address!=""){$Address.=".";}
                                                echo  $Address;
                                            ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="card">
                                        <div class="card-header p-6">
                                            <p class="text-center fs-16 fw-500">Shipping Address</p>
                                        </div>
                                        <div class="card-body">
                                            <?php 
                                                $DAddress="";
                                                if($EnqData->DAddress!=""){if($DAddress!=""){$DAddress.=",<br> ";}$DAddress.=$EnqData->DAddress;}
                                                if($EnqData->DCityName!=""){if($DAddress!=""){$DAddress.=",<br> ";}$DAddress.=$EnqData->DCityName;}
                                                if($EnqData->DTalukName!=""){if($DAddress!=""){$DAddress.=",<br> ";}$DAddress.=$EnqData->DTalukName;}
                                                if($EnqData->DDistrictName!=""){if($DAddress!=""){$DAddress.=",<br> ";}$DAddress.=$EnqData->DDistrictName;}
                                                if($EnqData->DStateName!=""){if($DAddress!=""){$DAddress.=",<br>";}$DAddress.=$EnqData->DStateName;}
                                                if($EnqData->DCountryName!=""){if($DAddress!=""){$DAddress.=", ";}$DAddress.=$EnqData->DCountryName;}
                                                if($EnqData->DPostalCode!=""){if($DAddress!=""){$DAddress.=" - ";}$DAddress.=$EnqData->DPostalCode;}
                                                if($DAddress!=""){$DAddress.=".";}
                                                echo  $DAddress;
                                            ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @if (count($AllocatedEnqData) == 0)
                            <div class="col-sm-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h6 class="text-center fw-700">Product Details</h6>
                                    </div>
                                    <div class="card-body">
                                        <table class="table" id="tblProductDetails">
                                            <thead>
                                                <tr>
                                                    <th class="text-center align-middle">S.No</th>
                                                    <th class="text-center align-middle">Product</th>
                                                    <th class="text-center align-middle">Qty</th>
                                                    <th class="text-center align-middle">Unit of Measurement</th>
                                                    <th class="text-center align-middle">Vendors List</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @php
                                                    $AllVendors=[];
                                                @endphp
                                                @foreach ($PData as $key=>$row)
                                                    <tr data-product-id="{{$row->ProductID}}" data-pcid="{{$row->CID}}" data-pscid="{{$row->SCID}}">
                                                        <td>{{$key + 1}}</td>
                                                        <td>{{$row->ProductName}}</td>
                                                        <td class="text-right">{{$row->Qty}}</td>
                                                        {{-- <td class="divInput">
                                                            <input class="form-control txtQty" type="number" value="{{$row->Qty}}">
                                                            <span class="errors txtQty-err err-sm"></span>
                                                        </td> --}}
                                                        <td data-uom-id="{{$row->UID}}">{{$row->UName}} ( {{$row->UCode}} )</td>
                                                        <td>
                                                            @foreach ($row->AvailableVendors as $item)
                                                                <span class="badge rounded-pill badge-secondary">{{$item['VendorName']}}</span>
                                                                @php
                                                                    $vendorID = $item['VendorID'];
                                                                    $vendorExists = false;

                                                                    foreach ($AllVendors as &$vendor) {
                                                                        if ($vendor['VendorID'] === $vendorID) {
                                                                            $vendor['VendorCount']++;
                                                                            $vendorExists = true;
                                                                            break;
                                                                        }
                                                                    }

                                                                    if (!$vendorExists) {
                                                                        $Vendors = [
                                                                            'VendorID' => $vendorID,
                                                                            'VendorName' => $item['VendorName'],
                                                                            'Rating' => $item['OverAll'],
                                                                            'VendorCount' => 1
                                                                        ];
                                                                        $AllVendors[] = $Vendors;
                                                                    }
                                                                @endphp
                                                            @endforeach
                                                        </td>
                                                    </tr>                                        
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="card-footer d-flex">
                                        @foreach ($AllVendors as $item)
                                            <div class="card w-auto">
                                                <div class="card-body">
                                                    <div class="row position-relative">
                                                        <div class="col-9 w-auto">
                                                            <span class="fs-16 fw-500 text-dark">{{$item['VendorName']}}</span>
                                                            <button type="button" title="View Vendor Ratings" data-vendor-id="{{$item['VendorID']}}" data-vendor-name="{{$item['VendorName']}}" class="btn btnVendorRatings"><i class="fa fa-eye text-dark"></i></button><br>
                                                            <span class="fs-12 text-dark">Available Products ({{ $item['VendorCount'] }} / {{count($PData)}})</span>
                                                        </div>
                                                        @if (count($VendorQuote)==0 && count($AllocatedEnqData) == 0)
                                                            <div class="col-3 w-auto">
                                                                <span class="checkbox checkbox-secondary">
                                                                    <input class="chkVendors" id="{{$item['VendorID']}}" type="checkbox">
                                                                    <label for="{{$item['VendorID']}}"></label>
                                                                </span>
                                                            </div>
                                                        @endif
                                                    </div>
                                                </div>
                                                <div class="stamp-badge position-absolute top-0 start-0 bg-success text-white rounded">
                                                    {{$item['Rating']}}
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            @if (count($VendorQuote)>0 && count($AllocatedEnqData) == 0)
                                <div class="col-12 col-sm-12 col-lg-12">
                                    <div class="card">
                                        <div class="card-header">
                                            <h6 class="text-center fw-700">Recieved Quotations</h6>
                                        </div>
                                        <div class="card-body">
                                            <table class="table" id="tblVendorQuote">
                                                <thead>
                                                    <tr>
                                                        <th class="text-center align-middle">S.No</th>
                                                        <th class="text-center align-middle">Product</th>
                                                        <th class="text-center align-middle">Qty</th>
                                                        @foreach ($VendorQuote as $quote)
                                                            <th class="text-center align-middle">{{ $quote->VendorName }}
                                                                @if($quote->Status == 'Requested') 
                                                                    <button type="button" data-vendor-id="{{ $quote->VendorID }}" class="btn btn-outline-primary btn-xs btnVendorPrice"> Add Vendor Price</button>  
                                                                @endif
                                                            </th>
                                                        @endforeach
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @foreach ($PData as $key => $row)
                                                        <tr data-product-id="{{ $row->ProductID }}" data-pcid="{{ $row->CID }}" data-pscid="{{ $row->SCID }}">
                                                            <td>{{ $key + 1 }}</td>
                                                            <td>{{ $row->ProductName }}</td>
                                                            <td class="text-center">{{ $row->Qty }} ( {{ $row->UCode }} )</td>
                                                            @foreach ($VendorQuote as $quote)
                                                                @php $found = false; @endphp
                                                                @foreach ($quote->ProductData as $item)
                                                                    @if ($row->ProductID === $item->ProductID)
                                                                        <td class="align-items-center align-middle">
                                                                            <div class="row d-flex align-items-center justify-content-center">
                                                                                <div class="col-6">
                                                                                    <div class="input-group divPriceInput">
                                                                                        <div class="input-group-text">
                                                                                            <input class="chkAmount" id="radio_{{ $loop->parent->index }}_{{ $loop->index }}" type="radio" name="amount_{{ $row->ProductID }}" value="{{ $quote->VendorID }}" data-vendor-id="{{ $quote->VendorID }}" data-vendor-quote-id="{{ $item->VQuoteID }}" data-quote-detail-id="{{ $item->DetailID }}">
                                                                                        </div>
                                                                                        <input type="number" class="form-control txtFinalPrice" value="{{ NumberFormat($item->Price, $Settings['PRICE-DECIMALS']) }}" step="0.01">
                                                                                    </div>
                                                                                    <span class="errors err-sm"></span>
                                                                                </div>
                                                                            </div>
                                                                        </td>
                                                                        @php $found = true; break; @endphp
                                                                    @endif
                                                                @endforeach
                                                                @unless ($found)
                                                                    <td> </td>
                                                                @endunless
                                                            @endforeach
                                                        </tr>
                                                    @endforeach
                                                </tbody>
                                                <tfoot>
                                                    <tr>
                                                        <th class="text-right align-middle" colspan="3">Additional Cost ==></th>
                                                        @foreach ($VendorQuote as $quote)
                                                            <th class="text-right align-middle">
                                                                <div class="row d-flex align-items-center justify-content-center">
                                                                    <div class="col-6">
                                                                        <div class="input-group">
                                                                            <div class="input-group-text SelectedItemCount" data-vendor-id="{{ $quote->VendorID }}">
                                                                                Items(0)
                                                                            </div>
                                                                            <input type="number" class="form-control txtAdditionalCost" value="{{ NumberFormat(0, $Settings['PRICE-DECIMALS']) }}" step="0.01" data-vendor-id="{{ $quote->VendorID }}" disabled>
                                                                        </div>
                                                                        <span class="errors err-sm"></span>
                                                                    </div>
                                                                </div>
                                                            </th>
                                                        @endforeach
                                                    </tr>
                                                </tfoot>
                                            </table>                                            
                                        </div>
                                    </div>
                                </div>
                            @endif
                        @else
                            <div class="col-12 col-sm-12 col-lg-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h6 class="text-center fw-700">Allocated Quotation</h6>
                                    </div>
                                    <div class="card-body">
                                        <table class="table" id="tblAllocatedQuote">
                                            <thead>
                                                <tr>
                                                    <th class="text-center align-middle">S.No</th>
                                                    <th class="text-center align-middle">Product Name</th>
                                                    <th class="text-center align-middle">Qty</th>
                                                    <th class="text-center align-middle">UOM</th>
                                                    <th class="text-center align-middle">Price per Unit<br> (₹)</th>
                                                    <th class="text-center align-middle">Tax Type</th>
                                                    <th class="text-center align-middle">Taxable<br> (₹)</th>
                                                    <th class="text-center align-middle">Tax Amount<br> (₹)</th>
                                                    <th class="text-center align-middle">CGST %</th>
                                                    <th class="text-center align-middle">CGST Amount<br> (₹)</th>
                                                    <th class="text-center align-middle">SGST %</th>
                                                    <th class="text-center align-middle">SGST Amount<br> (₹)</th>
                                                    <th class="text-center align-middle">IGST %</th>
                                                    <th class="text-center align-middle">IGST Amount<br> (₹)</th>
                                                    <th class="text-center align-middle">Total Amount<br> (₹)</th>
                                                    <th class="text-center align-middle">Allocated To<br> (₹)</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($AllocatedEnqData as $key=>$item)
                                                    <tr>
                                                        <td>{{$key + 1}}</td>
                                                        <td>{{$item->ProductName}}</td>
                                                        <td class="text-right">{{$item->Qty}}</td>
                                                        <td>{{$item->UName}} ({{$item->UCode}})</td>
                                                        <td class="text-right">{{NumberFormat($item->Price,$Settings['PRICE-DECIMALS'])}}</td>
                                                        <td>{{$item->TaxType}}</td>
                                                        <td class="text-right">{{NumberFormat($item->Taxable,$Settings['PRICE-DECIMALS'])}}</td>
                                                        <td class="text-right">{{NumberFormat($item->TaxAmount,$Settings['PRICE-DECIMALS'])}}</td>
                                                        <td class="text-right">{{NumberFormat($item->CGSTPer,$Settings['PERCENTAGE-DECIMALS'])}}</td>
                                                        <td class="text-right">{{NumberFormat($item->CGSTAmount,$Settings['PRICE-DECIMALS'])}}</td>
                                                        <td class="text-right">{{NumberFormat($item->SGSTPer,$Settings['PERCENTAGE-DECIMALS'])}}</td>
                                                        <td class="text-right">{{NumberFormat($item->SGSTAmount,$Settings['PRICE-DECIMALS'])}}</td>
                                                        <td class="text-right">{{NumberFormat($item->IGSTPer,$Settings['PERCENTAGE-DECIMALS'])}}</td>
                                                        <td class="text-right">{{NumberFormat($item->IGSTAmount,$Settings['PRICE-DECIMALS'])}}</td>
                                                        <td class="text-right">{{NumberFormat($item->Amount,$Settings['PRICE-DECIMALS'])}}</td>
                                                        <td><span class=" fw-600 text-info text-center">{{$item->VendorName}}</span></td>
                                                        </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                        <div class="row justify-content-end">
                                            {{-- <div class="col-sm-1"></div>
                                            <div class="col-sm-5 d-flex align-items-center">
                                                <h4 class="">Quotation allocated to <span class="text-info">{{$AllocatedEnqData[0]->VendorName}}</span></h4>
                                            </div> --}}
                                            <div class="col-sm-6">
                                                <div class="row mt-20 fw-600 fs-15 mr-10 justify-content-end">
                                                    <div class="col-4">Sub Total</div>
                                                    <div class="col-1">:</div>
                                                    <div class="col-3 text-right" id="divSubTotal">{{NumberFormat($AllocatedEnqData[0]->SubTotal,$Settings['PRICE-DECIMALS'])}}</div>
                                                </div>
                                                <div class="row mt-10 fw-600 fs-15 mr-10 justify-content-end">
                                                    <div class="col-4">CGST</div>
                                                    <div class="col-1">:</div>
                                                    <div class="col-3 text-right" id="divCGSTAmount">{{NumberFormat($AllocatedEnqData[0]->CGSTAmt,$Settings['PRICE-DECIMALS'])}}</div>
                                                </div>
                                                <div class="row mt-10 fw-600 fs-15 mr-10 justify-content-end">
                                                    <div class="col-4">SGST</div>
                                                    <div class="col-1">:</div>
                                                    <div class="col-3 text-right" id="divSGSTAmount">{{NumberFormat($AllocatedEnqData[0]->SGSTAmt,$Settings['PRICE-DECIMALS'])}}</div>
                                                </div>
                                                <div class="row mt-10 fw-600 fs-15 mr-10 justify-content-end">
                                                    <div class="col-4">IGST</div>
                                                    <div class="col-1">:</div>
                                                    <div class="col-3 text-right" id="divIGSTAmount">{{NumberFormat($AllocatedEnqData[0]->IGSTAmt,$Settings['PRICE-DECIMALS'])}}</div>
                                                </div>
                                                <div class="row mt-10 fw-600 fs-16 mr-10 justify-content-end text-success">
                                                    <div class="col-4">Total Amount</div>
                                                    <div class="col-1">:</div>
                                                    <div class="col-3 text-right" id="divTotalAmount">{{NumberFormat($AllocatedEnqData[0]->TotalAmount,$Settings['PRICE-DECIMALS'])}}</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endif
                    </div>
				</div>
                <div class="card-footer">
                    <div class="row">
                        <div class="col-sm-12 text-right">
                            @if($crud['view']==true)
                            <a href="{{url('/')}}/admin/admin/transaction/quote-enquiry" class="btn {{$Theme['button-size']}} btn-outline-dark mr-10" id="btnCancel">Back</a>
                            @endif
                            
                            @if($crud['add']==true && count($VendorQuote)==0 && count($AllocatedEnqData) == 0)
                                <button class="btn {{$Theme['button-size']}} btn-outline-success" id="btnRequestQuote">Request Quote</button>
                            @elseif(count($VendorQuote)>0 && count($AllocatedEnqData) == 0)
                                <button class="btn {{$Theme['button-size']}} btn-outline-info" id="btnQuoteConvert">Convert to Quotation</button>
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

        const camelCaseToWords=(text)=> {
            return text.replace(/([a-z])([A-Z])/g, '$1 $2');
        }
        const generateStarRating = (rating) => {
            const maxStars = 5;
            const filledStars = Math.floor(rating);
            let starsHtml = '';

            let contextualClass = 'text-primary';

            if (rating < 3) {
                contextualClass = 'text-danger';
            } else if (rating < 4) {
                contextualClass = 'text-warning';
            } else if (rating < 5) {
                contextualClass = 'text-success';
            }

            for (let i = 0; i < filledStars; i++) {
                starsHtml += `<i class="fa fa-star filled-star ${contextualClass}"></i>`;
            }

            return starsHtml;
        };
        /* const generateStarRating = (rating) => {
            const maxStars = 5;
            const filledStars = Math.floor(rating);
            const remainder = rating % 1;
            const emptyStars = maxStars - filledStars - (remainder > 0 ? 1 : 0);
            let starsHtml = '';

            for (let i = 0; i < maxStars; i++) {
                starsHtml += '<i class="far fa-star"></i>';
            }

            for (let i = 0; i < filledStars; i++) {
                starsHtml = starsHtml.replace('<i class="far fa-star"></i>', '<i class="fas fa-star filled-star"></i>');
            }

            if (remainder > 0) {
                starsHtml = starsHtml.replace('<i class="far fa-star"></i>', '<i class="fas fa-star-half-alt filled-star"></i>');
            }

            return starsHtml;
        }; */
        /* $("#tblVendorQuote").DataTable({
            searching: false,
            lengthChange: false,
            paging: false
        }); */
        
        /* $(document).on('click', '.btnQuoteView', function (e) {
            e.preventDefault();
            let QNo = $(this).closest('tr').find('td:eq(0)').html();
            let VendorName = $(this).closest('tr').find('td:eq(1)').html();
            let AllocateButton = $(this).closest('tr').find('.btnQuoteConvert').clone();
            $.ajax({
                type: "post",
                url: "{{url('/')}}/admin/transaction/quote-enquiry/get/vendor-quote-details",
                data: { QuoteSentID: $(this).attr('data-id'), VendorID: $(this).attr('data-vendor-id') },
                headers: { 'X-CSRF-Token': $('meta[name=_token]').attr('content') },
                success: function (response) {
                    let modalContent = $('<div>').append(response);

                    let table = $('<table class="table">');
                    let thead = $('<thead>').html(`<tr>
                                                        <th class="text-center align-middle">S.No</th>
                                                        <th class="text-center align-middle">Product Name</th>
                                                        <th class="text-center align-middle">Qty</th>
                                                        <th class="text-center align-middle">UOM</th>
                                                        <th class="text-center align-middle">Price per Unit<br> (₹)</th>
                                                        <th class="text-center align-middle">Tax Type</th>
                                                        <th class="text-center align-middle">Taxable<br> (₹)</th>
                                                        <th class="text-center align-middle">Tax Amount<br> (₹)</th>
                                                        <th class="text-center align-middle">CGST %</th>
                                                        <th class="text-center align-middle">CGST Amount<br> (₹)</th>
                                                        <th class="text-center align-middle">SGST %</th>
                                                        <th class="text-center align-middle">SGST Amount<br> (₹)</th>
                                                        <th class="text-center align-middle">Total Amount<br> (₹)</th>
                                                    </tr>`);
                    let tbody = $('<tbody>');

                    response.forEach(function (item, index) {
                    let row = $('<tr>').html(
                        `<td>${index + 1}</td>
                        <td>${item.ProductName}</td>
                        <td class="text-right">${item.Qty}</td>
                        <td>${item.UName} (${item.UCode})</td>
                        <td class="text-right">${Number(item.Price).toFixed({{$Settings['PRICE-DECIMALS']}})}</td>
                        <td>${item.TaxType}</td>
                        <td class="text-right">${Number(item.Taxable).toFixed({{$Settings['PRICE-DECIMALS']}})}</td>
                        <td class="text-right">${Number(item.TaxAmount).toFixed({{$Settings['PRICE-DECIMALS']}})}</td>
                        <td class="text-right">${Number(item.CGSTPer).toFixed({{$Settings['PRICE-DECIMALS']}})}</td>
                        <td class="text-right">${Number(item.CGSTAmount).toFixed({{$Settings['PRICE-DECIMALS']}})}</td>
                        <td class="text-right">${Number(item.SGSTPer).toFixed({{$Settings['PRICE-DECIMALS']}})}</td>
                        <td class="text-right">${Number(item.SGSTAmount).toFixed({{$Settings['PRICE-DECIMALS']}})}</td>
                        <td class="text-right">${Number(item.Amount).toFixed({{$Settings['PRICE-DECIMALS']}})}</td>`
                    );
                    tbody.append(row);
                    });

                    let totalPrice = response.reduce((total, item) => total + item.Amount, 0);
                    let totalTaxable = response.reduce((total, item) => total + item.Taxable, 0);
                    let totalCGST = response.reduce((total, item) => total + item.CGSTAmount, 0);
                    let totalSGST = response.reduce((total, item) => total + item.SGSTAmount, 0);
                    let totalIGST = 0;

                    let tfoot = $('<div>').html(`
                        <div class="row justify-content-end">
                            <div class="col-sm-6">
                                <div class="row mt-20 fw-600 fs-15 mr-10 justify-content-end">
                                    <div class="col-4">Sub Total</div>
                                    <div class="col-1">:</div>
                                    <div class="col-3 text-right" id="divSubTotal">${totalTaxable.toFixed({{$Settings['PRICE-DECIMALS']}})}</div>
                                </div>
                                <div class="row mt-10 fw-600 fs-15 mr-10 justify-content-end">
                                    <div class="col-4">CGST</div>
                                    <div class="col-1">:</div>
                                    <div class="col-3 text-right" id="divCGSTAmount">${totalCGST.toFixed({{$Settings['PRICE-DECIMALS']}})}</div>
                                </div>
                                <div class="row mt-10 fw-600 fs-15 mr-10 justify-content-end">
                                    <div class="col-4">SGST</div>
                                    <div class="col-1">:</div>
                                    <div class="col-3 text-right" id="divSGSTAmount">${totalSGST.toFixed({{$Settings['PRICE-DECIMALS']}})}</div>
                                </div>
                                <div class="row mt-10 fw-600 fs-15 mr-10 justify-content-end">
                                    <div class="col-4">IGST</div>
                                    <div class="col-1">:</div>
                                    <div class="col-3 text-right" id="divIGSTAmount">${totalIGST.toFixed({{$Settings['PRICE-DECIMALS']}})}</div>
                                </div>
                                <div class="row mt-10 fw-600 fs-16 mr-10 justify-content-end text-success">
                                    <div class="col-4">Total Amount</div>
                                    <div class="col-1">:</div>
                                    <div class="col-3 text-right" id="divTotalAmount">${totalPrice.toFixed({{$Settings['PRICE-DECIMALS']}})}</div>
                                </div>
                            </div>
                        </div>`);

                    modalContent.append(table.append(thead).append(tbody)).append(tfoot);
                    let modalFooter = $('<div class="modal-footer">').html(AllocateButton);

                    let dialog = bootbox.dialog({
                        title: 'Quotation Details ( ' + VendorName + ' - ' + QNo + ' )',
                        closeButton: true,
                        message: modalContent,
                        className: 'modal-xl',
                    });
                    $(".modal-xl").css("max-width", "90% !important");
                    dialog.find('.modal-content').append(modalFooter);

                    modalFooter.on('click', 'button', function () {
                        dialog.modal('hide');
                    });
                }
            });
        }); */
        $(document).on('click', '#btnQuoteConvert', function (e) {
            let status = false;
            $('#tblVendorQuote tbody tr').each(function () {
                if ($(this).find('.chkAmount:checked').length == 0) {
                    status = false;toastr.error("Select All Product Prices!", "Failed", {positionClass: "toast-top-right",containerId: "toast-top-right",showMethod: "slideDown",hideMethod: "slideUp",progressBar: !0})
                    return false;
                } else {
                    status = true;
                }
            });

            if(status){
                EnqData = [];
                $('#tblVendorQuote tbody tr').each(function () {
                    let  PData = {
                        ProductID : $(this).attr('data-product-id'),
                        VendorID : $(this).find('.chkAmount:checked').val(),
                        FinalPrice : $(this).find('.chkAmount:checked').closest('.divPriceInput').find('.txtFinalPrice').val(),
                        VQuoteID : $(this).find('.chkAmount:checked').attr('data-vendor-quote-id'),
                        DetailID : $(this).find('.chkAmount:checked').attr('data-quote-detail-id'),
                    }
                    EnqData.push(PData);
                });
                console.log(EnqData);
                let formData = new FormData();
                formData.append('EnqData', JSON.stringify(EnqData));
                swal({
                    title: "Are you sure?",
                    text: "You want to Convert Quotation",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-outline-success",
                    confirmButtonText: "Yes, Convert it!",
                    closeOnConfirm: false
                },function(){
                    swal.close();
                    btnLoading($('#btnQuoteConvert'));
                    let postUrl="{{ url('/') }}/admin/transaction/quote-enquiry/quote-convert/{{$EnqData->EnqID}}";
                    $.ajax({
                        type:"post",
                        url:postUrl,
                        headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') },
                        data:formData,
                        cache: false,
                        processData: false,
                        contentType: false,
                        error:function(e, x, settings, exception){ajaxErrors(e, x, settings, exception);},
                        complete: function(e, x, settings, exception){btnReset($('#btnQuoteConvert'));ajaxIndicatorStop();$("html, body").animate({ scrollTop: 0 }, "slow");},
                        success:function(response){
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
                                    window.location.replace("{{url('/')}}/admin/transaction/quote-enquiry");
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
            }
        });

        const validateGetData=()=>{
			let status = true;
            let SelectedVendors = [];
            $('.chkVendors').each(function () {
                if ($(this).is(':checked')) {
                    status1 = true;
                    SelectedVendors.push($(this).attr('id'));
                }
            });
            if(SelectedVendors.length == 0) {
                status = false;
                toastr.error("Please select a Vendor!", "Failed", {positionClass: "toast-top-right",containerId: "toast-top-right",showMethod: "slideDown",hideMethod: "slideUp",progressBar: !0})
            }
            $(".errors").each(function () {
                if ($(this).html()) {
                    let Element = $(this).closest('.divInput').find('input');
                    Element.focus();
                    status = false;
                    return false;
                }
            });
			let ProductDetails=[];
			$("#tblProductDetails tbody tr").each(function () {
				let PData = {
					ProductID: $(this).attr("data-product-id"),
					UOMID: $(this).find('td:eq(3)').attr("data-uom-id"),
					PCID: $(this).attr("data-pcid"),
					PSCID: $(this).attr("data-pscid"),
					// Qty: $(this).find(".txtQty").val(),
					Qty: $(this).find('td:eq(2)').html(),
				};
                ProductDetails.push(PData);
			});
			let formData = new FormData();
			formData.append('SelectedVendors', JSON.stringify(SelectedVendors));
			formData.append('ProductDetails', JSON.stringify(ProductDetails));
			return {formData , status};
		}
        $(document).on('input', '.txtQty', function () {
			let errorElement = $(this).closest('.divInput').find('.txtQty-err');
			let inputValue = parseFloat($(this).val());
			if (isNaN(inputValue)) {inputValue = 0;}
			if (inputValue < 0) {errorElement.text("Quantity cannot be less than 0");} else {errorElement.text("");}
			$(this).val(inputValue);
		});

        const LoadAdditionalCost = () => {
            $('.txtAdditionalCost').each(function () {
                let vendorId = $(this).data('vendor-id');
                let VendorCount=$('.chkAmount:checked[data-vendor-id="' + vendorId + '"]').length;
                if (VendorCount > 0) {
                    $(this).prop('disabled', false);
                } else {
                    $(this).prop('disabled', true);
                }
                $('.SelectedItemCount[data-vendor-id="' + vendorId + '"]').text('Items(' + VendorCount + ')');
            });
        };

        $(document).on('change', '.chkAmount', function () {
            LoadAdditionalCost();
        });

        $(document).on('click', '.btnVendorRatings', function (e) {
            e.preventDefault();
            let VendorName = $(this).attr('data-vendor-name');
            $.ajax({
                type: "post",
                url: "{{url('/')}}/admin/transaction/quote-enquiry/get/vendor-ratings",
                data: { VendorID: $(this).attr('data-vendor-id') },
                headers: { 'X-CSRF-Token': $('meta[name=_token]').attr('content') },
                success: function (response) {
                    let modalContent = $('<div></div>');
                    let row = $('<div class="row my-3 justify-content-center">').html(
                            `<div class="row">
                                <div class="col-12 text-center">
                                    <img src="{{ url('/') }}/${response.Logo}" alt="Vendor Logo" class="img-fluid rounded" height="150" width="150">
                                </div>
                                <div class="row mt-20">
                                    <div class="col-7">
                                        <h6 class="text-center my-2">Vendor Info</h6>
                                        <div class="row">
                                            <div class="col-sm-5 fs-15 fw-600">Vendor Name</div>
                                            <div class="col-sm-1 fs-15 fw-600 text-center">:</div>
                                            <div class="col-sm-5 fs-15">${response.VendorName}</div>
                                        </div>
                                        <div class="row my-1">
                                            <div class="col-sm-5 fs-15 fw-600">Address</div>
                                            <div class="col-sm-1 fs-15 fw-600 text-center">:</div>
                                            <div class="col-sm-5 fs-15">${response.Address}, ${response.CityName}<br>${response.TalukName}, ${response.DistrictName}<br>${response.StateName}-${response.PostalCode}</div>
                                        </div>
                                        <div class="row my-1">
                                            <div class="col-sm-5 fs-15 fw-600">GST No</div>
                                            <div class="col-sm-1 fs-15 fw-600 text-center">:</div>
                                            <div class="col-sm-5 fs-15">${response.GSTNo}</div>
                                        </div>
                                        <div class="row my-1">
                                            <div class="col-sm-5 fs-15 fw-600">Mobile No</div>
                                            <div class="col-sm-1 fs-15 fw-600 text-center">:</div>
                                            <div class="col-sm-5 fs-15">${response.MobileNumber1}</div>
                                        </div>
                                    </div>
                                    <div class="col-5">
                                        <h6 class="text-center my-2">Key Points</h6>
                                        <div class="mt-2 fs-15">• ${response.VendorName} is with us since <b>${response.TotalYears}.</b></div>
                                        <div class="my-2 fs-15">• Has completed <b>${response.TotalOrders}</b> orders worth INR <b>${Number(response.OrderValue).toFixed({{$Settings['PRICE-DECIMALS']}})}.</b></div>
                                        <div class="my-2 fs-15">• Has ${generateStarRating(response.CustomerRating)} Customer rating and ${generateStarRating(response.AdminRating)} Admin Rating.</div>
                                        <div class="my-2 fs-15">• Has outstanding of <b>INR ${Number(response.Outstanding).toFixed({{$Settings['PRICE-DECIMALS']}})}.</b></div>
                                        <div class="my-2 fs-15">• Has an Overall Rating of <b>${response.OverAll}.</b></div>
                                    </div>
                                </div>                                
                            </div>`);
                        modalContent.append(row);

                    /* Object.keys(response).forEach(function (key) {
                        let item = response[key];
                        let formattedKey = camelCaseToWords(key);

                        let rowContent;
                        if (key === 'CustomerRating' || key === 'AdminRating') {
                            rowContent = generateStarRating(item);
                        }else if (key === 'Outstanding' || key === 'OrderValue') {
                            rowContent = Number(item).toFixed({{$Settings['PRICE-DECIMALS']}});
                        }else if (key === 'OverAll') {
                            rowContent = '<span class="fw-600">'+item+'</span>';
                        }else {
                            rowContent = item;
                        }
                    }); */

                    let dialog = bootbox.dialog({
                        title: "Vendor Details",
                        // title: VendorName+' - Ratings',
                        closeButton: true,
                        message: modalContent,
                        className: 'modal-xl',
                    });
                    dialog.find('.modal-title').css({ 'margin': '0 auto', 'display': 'inline-block' });
                }
            });
        });

        $('#btnRequestQuote').click(async function(){
            let { formData , status } = await validateGetData();
            if(status){
                swal({
                    title: "Are you sure?",
                    text: "You want to Send Quote Request!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-outline-success",
                    confirmButtonText: "Yes, Send it!",
                    closeOnConfirm: false
                },function(){
                    swal.close();
                    btnLoading($('#btnRequestQuote'));
                    let postUrl="{{ url('/') }}/admin/transaction/quote-enquiry/request-quote/{{$EnqData->EnqID}}";
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
                        complete: function(e, x, settings, exception){btnReset($('#btnRequestQuote'));ajaxIndicatorStop();$("html, body").animate({ scrollTop: 0 }, "slow");},
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
                                    window.location.replace("{{url('/')}}/admin/transaction/quote-enquiry");
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
                                        if(key=="TaxName"){$('#txtTaxName-err').html(KeyValue);}
                                        if(key=="Percentage"){$('#txtPercentage-err').html(KeyValue);}
                          
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