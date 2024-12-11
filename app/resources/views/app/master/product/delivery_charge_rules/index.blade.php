@extends('layouts.app')

@section('content')
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="{{ url('/') }}" title=""><i class="f-16 fa fa-home"></i></a>
                        </li>
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
                    <h5 class="text-center flex-grow-1 mb-0">Create/Update Rules</h5>

                </div>
                <div class="card-body">
                    <form id="delivery-charge-form" action="{{ route('delivery-charge-rules.store') }}" method="POST">
                        @csrf
                        @method('POST')
                        <input type="hidden" name="id" id="form-id" value="{{ old('id') }}">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="min_order_value">Minimum Order Value</label>
                                    <input type="number" step="0.01" name="min_order_value" id="min_order_value"
                                           class="form-control @error('min_order_value') is-invalid @enderror"
                                           value="{{ old('min_order_value') }}">
                                    @error('min_order_value')
                                    <div class="invalid-feedback">{{ $message }}</div>
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
                                    <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label for="delivery_charge">Delivery Charge</label>
                                    <input type="number" step="0.01" name="delivery_charge" id="delivery_charge"
                                           class="form-control @error('delivery_charge') is-invalid @enderror"
                                           value="{{ old('delivery_charge') }}">
                                    @error('delivery_charge')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-sm-6 d-flex justify-content-center align-items-center mt-30">
                                <button type="submit" class="btn btn-primary mr-20">Save</button>
                                <button type="button" id="hide-form" class="btn btn-danger">Close</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <hr>
        </div>

        <div class="d-flex justify-content-between align-items-center mb-5">
            <h4 class="text-center flex-grow-1 mb-0">Existing Delivery Charge Rules</h4>
            <button id="show-form" class="btn btn-outline-success btn-air-success btn-sm">Create New Rule</button>
        </div>

        <table class="table" id="tblDeliveryChargeRules">
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
                    <td>₹{{ $rule->max_order_value }}</td>
                    <td>₹{{ $rule->delivery_charge }}</td>
                    <td>
                        <button class="btn btn-outline-success btn-sm mr-10 btnEdit" data-id="{{ $rule->id }}"><i class="fa fa-pencil"></i></button>
                        <button class="btn btn-outline-danger btn-sm btnDelete" data-id="{{ $rule->id }}"><i class="fa fa-trash" aria-hidden="true"></i></button>
                    </td>
                </tr>
            @endforeach
            </tbody>
        </table>
    </div>
@endsection

@section('scripts')
    <script>
        $(document).ready(function () {
            $('#show-form').click(function () {
                $('.invalid-feedback').text('');
                $('.form-control').removeClass('is-invalid');
                $('#form-container input').val('');
                $(this).hide();
                $('#delivery-charge-form').attr('action', "{{ route('delivery-charge-rules.store') }}");
                $('#form-id').val('');
                $('input[name="_token"]').val('{{ csrf_token() }}');
                $('input[name="_method"]').val('POST');
                $('button[type="submit"]').text('Save');
                $('#form-container').show();
            });

            $('#hide-form').click(function () {
                $('#show-form').show();
                $('#form-container').hide();
            });

            $('#clear-form').click(function () {
                $('.invalid-feedback').text('');
                $('.form-control').removeClass('is-invalid');
                $('#delivery-charge-form')[0].reset().attr('action', "{{ route('delivery-charge-rules.store') }}");
                $('#form-id').val('');
                $('input[name="_method"]').val('POST');
                $('input[name="_token"]').val('{{ csrf_token() }}');
            });

            $(document).on('click', '.btnEdit', function () {
                $('.invalid-feedback').text('');
                $('.form-control').removeClass('is-invalid');
                const id = $(this).data('id');
                $.ajax({
                    url: `{{ url('/admin/master/product/delivery-charge-rules') }}/${id}/edit`,
                    type: 'GET',
                    success: function (data) {
                        $('#form-container').show();
                        $('#show-form').hide();
                        $('#form-id').val(data.id);
                        $('#min_order_value').val(data.min_order_value);
                        $('#max_order_value').val(data.max_order_value);
                        $('#delivery_charge').val(data.delivery_charge);
                        $('#delivery-charge-form').attr('action', `{{ url('/admin/master/product/delivery-charge-rules') }}/${id}`);
                        $('input[name="_method"]').val('PUT');
                        $('button[type="submit"]').text('Update');
                        $('input[name="_token"]').val('{{ csrf_token() }}');
                    }
                });
            });

            $(document).on('click', '.btnDelete', function () {
                let id = $(this).data('id');
                swal({
                        title: "Are you sure?",
                        text: "You want Delete this rule!",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonClass: "btn-outline-danger",
                        confirmButtonText: "Yes, Delete it!",
                        closeOnConfirm: false
                    },
                    function () {
                        swal.close();
                        $.ajax({
                            type: "POST",
                            url: `{{ url('/admin/master/product/delivery-charge-rules') }}/${id}`,
                            headers: {'X-CSRF-Token': $('meta[name=_token]').attr('content')},
                            data: {_method: 'DELETE'},
                            success: function (response) {
                                if (response.status) {
                                    $('#tblDeliveryChargeRules').DataTable()
                                        .row($(`button[data-id="${id}"]`).parents('tr'))
                                        .remove()
                                        .draw();
                                    toastr.success(response.message, "Success", {positionClass: "toast-top-right"});
                                } else {
                                    toastr.error(response.message, "Failed", {positionClass: "toast-top-right"});
                                }
                            }
                        });
                    });
            });

            $('#tblDeliveryChargeRules').DataTable({
                "bProcessing": true,
                "bServerSide": false,
                deferRender: true,
                responsive: true,
                dom: 'Bfrtip',
                "iDisplayLength": 10,
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
                buttons: ['pageLength'],
                columnDefs: [
                    {"className": "dt-center", "targets": 3, "sorting": false}
                ]
            });

            @foreach (['success', 'error'] as $msg)
            @if(session($msg))
            toastr.{{ $msg }}("{{ session($msg) }}", "{{ ucfirst($msg) }}", {positionClass: "toast-top-right"});
            @endif
            @endforeach


            @if ($errors->any())
            $('#form-container').show();
            $('#show-form').hide();
            @if(old('id'))
            $('#delivery-charge-form').attr('action', "{{ route('delivery-charge-rules.update', old('id')) }}")
                .find('input[name="_method"]').val('PUT');
            @else
            $('#delivery-charge-form').attr('action', "{{ route('delivery-charge-rules.store') }}")
                .find('input[name="_method"]').val('POST');
            @endif
            @endif
        });
    </script>
@endsection
