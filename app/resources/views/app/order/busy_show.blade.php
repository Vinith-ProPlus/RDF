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
                        <li class="breadcrumb-item"><a href="{{ url('/admin/busy') }}">Busy Orders</a></li>
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
                    <div class="card-header text-center">
                        <h5 class="mt-10">Busy Bill - {{ $EditData->OrderNo ?? '' }}</h5>
                    </div>
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
                            <div class="col-sm-12 mt-20">
                                <div class="form-group">
                                    <label for="lstCOType"><b>Address :</b></label>
                                    <label>{{ $EditData->CompleteAddress ?? '' }}</label>
                                </div>
                            </div>
                            <div class="col-sm-12 mt-20">
                                <div class="form-group">
                                    <label for="lstCOType"><b>Busy Sale ID :</b></label>
                                    <label>{{ $EditData->BusySaleID }}</label>
                                </div>
                            </div>
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

                        <div class="row col-sm-12 text-center">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10 mt-20 text-center">
                                <div class="text-center"><h6>Tax Details</h6></div>
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Tax Percentage</th>
                                        <?php
                                        $hasSGST = $hasCGST = $hasIGST = false;

                                        foreach ($EditData->taxes as $taxDetails) {
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

                                    foreach ($EditData->taxes as $taxPercentage => $taxDetails) {
                                        $sgst = isset($taxDetails['SGST']) ? round($taxDetails['SGST'],2) : 0;
                                        $cgst = isset($taxDetails['CGST']) ? round($taxDetails['CGST'],2) : 0;
                                        $igst = isset($taxDetails['IGST']) ? round($taxDetails['IGST'],2) : 0;
                                        $total = isset($taxDetails['Total']) ? round($taxDetails['Total'],2) : 0;

                                        $totals['SGST'] += $sgst;
                                        $totals['CGST'] += $cgst;
                                        $totals['IGST'] += $igst;
                                        $totals['Total'] += $total;

                                        echo "<tr>";
                                        echo "<td>{$taxPercentage}%</td>";
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
                            <div class="col-sm-1"></div>
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
