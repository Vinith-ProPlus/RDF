<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .header {
            text-align: center;
            font-weight: bold;
        }
        .order-info {
            margin-bottom: 20px;
            line-height: 1.5;
        }
        .order-info p {
            margin: 0;
            font-weight: bold;
        }
        .product-info table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .product-info th {
            background-color: black;
            color: white;
            padding: 10px 5px;
            text-align: left;
            font-size: 0.8em;
        }
        .product-info td {
            padding: 10px;
        }
        .product-info .product-name {
            font-size: 0.7em;
        }
        .product-info .product-weight {
            color: grey;
            font-size: 0.65em;
        }
        .product-info .product-qty {
            font-size: 0.7em;
            text-align: center;
        }
        .separator {
            border-top: 1px solid rgb(216, 216, 216);
        }
        .separator td {
            padding: 0 !important;
        }
    </style>
    <title></title>
</head>
<body style="margin-top: 0 !important;">
<div class="container">
    <div class="header">
        <h3 style="margin-top: 0 !important;">Royal Dry Fruits</h3>
    </div>
    <div class="order-info">
        <p><strong>{{ $order->CustomerName ?? '' }}</strong></p>
        <p><strong>{{ $order->CompleteAddress ?? '' }}</strong></p>
        <p><strong>PH: {{ $order->MobileNo1 ?? '' }}</strong></p>
    </div>
    <p style="margin-bottom: 5px !important;">Order Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ $order->OrderNo ?? '' }}</p>
    <p style="margin-top: 0 !important;">Order Date:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{ $order->OrderDate ?? '' }}</p>
    <div class="product-info">
        <table>
            <thead>
            <tr>
                <th style="width: 85%;">Product</th>
                <th style="width: 15%;">Quantity</th>
            </tr>
            </thead>
            <tbody>
            @foreach ($order->orderDetails as $index => $product)
                <tr>
                    <td class="product-name">{{ $product->ProductName ?? '' }}<br>
                        <span class="product-weight">Weight: {{ $product->weight ?? '' }}</span></td>
                    <td class="product-qty">{{ $product->Qty ?? '' }}</td>
                </tr>
                @if ($index < count($order->orderDetails) - 1)
                    <tr class="separator">
                        <td colspan="2"></td>
                    </tr>
                @endif
            @endforeach
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
