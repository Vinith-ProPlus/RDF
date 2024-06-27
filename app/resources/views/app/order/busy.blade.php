@extends('layouts.app')
@section('content')
<link href='//fonts.googleapis.com/css?family=Open+Sans:100,200,300,400,500,600,700|Montserrat:100,200,300,400,500,600,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="{{url('/')}}/assets/css/support-ticket.css">
<style>
    body,.page-body{
        background-color: #F3F3F3 !important;
        background: #F3F3F3 !important;
    }
    .card{
        font-family: "Montserrat",sans-serif !important;
        font-weight: 400 !important;
        line-height: 1.2 !important;
    }
    tbody td{
        text-align: center !important;
    }
</style>
<div class="card container-fluid mt-100 pt-40">
    @if($crud['add']==1)
        <div class="row" style="margin-bottom:80px;">
            <div class="col-sm-12 text-right">
{{--                <button type="button" id="btnNewTicket" class="btn btn-outline-success btn-min-width box-shadow-2 round">New Ticket</button>--}}
            </div>
        </div>
    @endif
    <div class="row d-flex justify-content-center mb-10 d-none">
        <div class="col-sm-1 text-center fw-700 fs-16 pt-30">
            Filter
        </div>
        <div class="col-sm-2">
            <div class="form-group text-center mh-60">
                <label style="margin-bottom:0px;">From Date</label>
                <input type="date" class="form-control" id="dtpFromDate" value="{{date('Y-m-d',strtotime('-30 days'))}}">
            </div>
        </div>
        <div class="col-sm-2">
            <div class="form-group text-center mh-60">
                <label style="margin-bottom:0px;">To Date</label>
                <input type="date" class="form-control" id="dtpToDate" value="{{date('Y-m-d')}}">
            </div>
        </div>
        <div class="col-sm-2">
            <div class="form-group text-center mh-60">
                <label style="margin-bottom:0px;">User</label>
                <select class="form-control select2" id="lstUser">
                    <option value="">All Users</option>
{{--                    @foreach($customers as $customer)--}}
{{--                        <option value="{{ $customer->CustomerID }}">{{ $customer->CustomerName ?? $customer->nick_name ?? $customer->MobileNo1 }}</option>--}}
{{--                    @endforeach--}}
                </select>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="form-group text-center mh-60">
                <label style="margin-bottom:0px;">Status</label>
                <select class="form-control" id="lstStatus">
                    <option value="">All</option>
{{--                    <option value="Payment Pending">Payment Pending</option>--}}
                    <option value="Order Confirmed">Order Confirmed</option>
                    <option value="Shipped">Shipped</option>
                    <option value="Delivered">Delivered</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row" style="margin-bottom:80px;">
        <div class="col-sm-12">
            <table class="table {{$Theme['table-size']}}" id="tblorders">
                <thead>
                    <tr>
                        <th class="text-center">Order No</th>
                        <th class="text-center">Ordered Date</th>
                        <th class="text-center">Amount</th>
                        <th class="text-center noExport">Action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <button class="display-none" id="btnReload"></button>
</div>

@endsection
@section('scripts')
    <script>
        $(document).ready(function(){
            let Table=null;
            const init_DataTable=async()=>{
                if(Table!=null){
                    Table.fnDestroy();
                }
                let data={
                    FromDate:$('#dtpFromDate').val(),
                    ToDate:$('#dtpToDate').val(),
                    User:$('#lstUser').val(),
                    Status:$('#lstStatus').val()
                }
                {{--Table=$('#tblorders').dataTable({--}}
                {{--    "bProcessing": true,--}}
                {{--    deferRender: true,--}}
				{{--    responsive: true,--}}
                {{--    dom: 'Bfrtip',--}}
                {{--    "searching": true,--}}
                {{--    "info": false,--}}
                {{--    "order": [[ 0, "desc" ]],--}}
                {{--    "iDisplayLength": 10,--}}
                {{--    "lengthMenu": [[10, 25, 50,100,250, 500, -1], [10, 25, 50,100,250, 500, "All"]],--}}
                {{--    "bServerSide": true,--}}
                {{--    createdRow: function (row, data, index) {--}}
                {{--        $(row).addClass('btnDetails');--}}
                {{--        $(row).attr('id',data[0]);--}}
                {{--        /*let t2=$(row).children()[0];--}}
                {{--        let t=data[0].split('-');--}}
                {{--        t2.innerHTML="#"+t[1].replace(/^0+/, '');*/--}}
                {{--    },--}}
                {{--    "ajax": {"url":"{{url('/')}}/admin/busy/data?_token="+$('meta[name=_token]').attr('content'),"headers":{ 'X-CSRF-Token' : $('meta[name=_token]').attr('content') },data:data ,"type": "POST"},--}}
                {{--    columns: [--}}
                {{--        {data: 'DT_RowIndex'},--}}
                {{--        {data: 'vchno'},--}}
                {{--        {data: 'Date'},--}}
                {{--        {data: 'VchSalePurcAmt'},--}}
                {{--        {data: 'action', orderable: false},--}}
                {{--//         'id' => (int) $row['vchCode'],--}}
                {{--//     'vchno' => trim((string) $row['vchno']),--}}
                {{--// 'Date' => Carbon::parse($row['Date'])->format('d-M-Y'),--}}
                {{--//     'VchSalePurcAmt' => (float) $row['VchSalePurcAmt'],--}}
                {{--    ],--}}
                {{--    buttons: [--}}
                {{--        'pageLength'--}}
                {{--        @if($crud['excel']==1) ,{extend: 'excel',className:"{{$Theme['button-size']}}",footer: true,title: "{{$PageTitle}}","action": DataTableExportOption,exportOptions: {columns: "thead th:not(.noExport)"}} @endif--}}
                {{--        @if($crud['copy']==1) ,{extend: 'copy',className:"{{$Theme['button-size']}}",footer: true,title: "{{$PageTitle}}","action": DataTableExportOption,exportOptions: {columns: "thead th:not(.noExport)"}} @endif--}}
                {{--        @if($crud['csv']==1) ,{extend: 'csv',className:"{{$Theme['button-size']}}",footer: true,title: "{{$PageTitle}}","action": DataTableExportOption,exportOptions: {columns: "thead th:not(.noExport)"}} @endif--}}
                {{--        @if($crud['print']==1) ,{extend: 'print',className:"{{$Theme['button-size']}}",footer: true,title:  "{{$PageTitle}}","action": DataTableExportOption,exportOptions: {columns: "thead th:not(.noExport)"}} @endif--}}
                {{--        @if($crud['pdf']==1) ,{extend: 'pdf',className:"{{$Theme['button-size']}}",footer: true,title:  "{{$PageTitle}}","action": DataTableExportOption,exportOptions: {columns: "thead th:not(.noExport)"}} @endif--}}
                {{--    ],--}}
                {{--});--}}
                Table = $('#tblorders').DataTable({
                    "columnDefs": [
                        {"className": "dt-center", "targets": "_all"}
                    ],
                    processing: true,
                    serverSide: true,
                    ajax: {
                        url: '{{ route("admin.busy.view") }}',
                        type: 'GET'
                    },
                    columns: [
                        // {data: 'DT_RowIndex'},
                        // {data: 'name'},
                        // {data: 'action', orderable: false},
                        // {data: 'DT_RowIndex'},
                        {data: 'vchno'},
                        {data: 'Date'},
                        {data: 'VchSalePurcAmt'},
                        {data: 'action', orderable: false},
                    ]
                });
            }
            $('#btnReload').click(function(){
                $('#tblorders').DataTable().ajax.reload();
            });
            $('#lstStatus').change(function(){
                init_DataTable();
            });
            $('#lstUser').change(function(){
                init_DataTable();
            });
            $('#dtpFromDate').change(function(){
                init_DataTable();
            });
            $('#dtpToDate').change(function(){
                init_DataTable();
            });
            $(document).on('click','.btnEdit',function(){
                window.location.replace("{{url('/')}}/admin/busy/show/"+ $(this).attr('data-id'));
            });
            init_DataTable();
        });
    </script>
@endsection
