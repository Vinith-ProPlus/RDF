@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/') }}" title=""><i class="f-16 fa fa-home"></i></a></li>
                        <li class="breadcrumb-item">Product Master</li>
                        <li class="breadcrumb-item">{{ $PageTitle }}</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div id="form-container" class="col-sm-8 mx-auto" style="display: none;">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="text-center flex-grow-1 mb-0">Create Rules</h5>
                    <button id="hide-form" class="btn btn-danger">Close</button>
                </div>
                <div class="card-body">
                    <form action="{{ route('delivery-charge-rules.store') }}" method="POST">
                        @csrf
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="min_order_value">Minimum Order Value</label>
                                    <input type="number" step="0.01" name="min_order_value" id="min_order_value"
                                           class="form-control @error('min_order_value') is-invalid @enderror"
                                           value="{{ old('min_order_value') }}" required>
                                    @error('min_order_value')
                                    <span class="invalid-feedback" role="alert">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="max_order_value">Maximum Order Value</label>
                                    <input type="number" step="0.01" name="max_order_value" id="max_order_value"
                                           class="form-control @error('max_order_value') is-invalid @enderror"
                                           value="{{ old('max_order_value') }}">
                                    @error('max_order_value')
                                    <span class="invalid-feedback" role="alert">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="delivery_charge">Delivery Charge</label>
                                    <input type="number" step="0.01" name="delivery_charge" id="delivery_charge"
                                           class="form-control @error('delivery_charge') is-invalid @enderror"
                                           value="{{ old('delivery_charge') }}" required>
                                    @error('delivery_charge')
                                    <span class="invalid-feedback" role="alert">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-sm-6 d-flex align-items-center">
                                <button type="submit" class="btn btn-primary mr-3">Save</button>
                                <button type="button" id="clear-form" class="btn btn-secondary">Clear</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <hr>
        </div>

        <div class="d-flex justify-content-between align-items-center mb-5">
            <h4 class="text-center flex-grow-1 mb-0">Existing Delivery Charge Rules</h4>
            <button id="show-form" class="btn btn-success">Create New Rule</button>
        </div>

        <table class="table">
            <thead>
            <tr>
                <th>Minimum Order Value</th>
                <th>Maximum Order Value</th>
                <th>Delivery Charge</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            @foreach($rules as $rule)
                <tr>
                    <td>₹{{ $rule->min_order_value }}</td>
                    <td>{{ $rule->max_order_value ? '₹'.$rule->max_order_value : 'No Limit' }}</td>
                    <td>₹{{ $rule->delivery_charge }}</td>
                    <td>
                        <button class="btn btn-sm btn-warning">Edit</button>
                        <button class="btn btn-sm btn-danger">Delete</button>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>
@endsection

@section('scripts')
    <script>
        $(document).ready(function() {
            $('#show-form').click(function() {
                $(this).hide();
                $('#form-container').show();
            });

            $('#hide-form').click(function() {
                $('#form-container').hide();
                $('#show-form').show();
            });

            $('#clear-form').click(function() {
                $('#form-container input').val('');
            });

            @if ($errors->any())
            $('#form-container').show();
            $('#show-form').hide();
            @endif

            const LoadTable = async () => {
                @if($crud['view'] == 1)
                $('.table').dataTable({
                    "bProcessing": true,
                    "bServerSide": false,
                    deferRender: true,
                    responsive: true,
                    dom: 'Bfrtip',
                    "iDisplayLength": 10,
                    "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                    buttons: [
                        'pageLength'
                    ],
                    columnDefs: [
                        {"className": "dt-center", "targets": 2},
                        {"className": "dt-center", "targets": 3}
                    ]
                });
                @endif
            }

            LoadTable();
        });
    </script>
@endsection
