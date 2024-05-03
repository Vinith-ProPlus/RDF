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
    <div class="row  d-flex justify-content-center">
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
                    @foreach($customers as $customer)
                        <option value="{{ $customer->CustomerID }}">{{ $customer->CustomerName ?? $customer->nick_name}}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="col-sm-2">
            <div class="form-group text-center mh-60">
                <label style="margin-bottom:0px;">Status</label>
                <select class="form-control" id="lstStatus">
                    <option value="">All</option>
                    <option value="In progress">In progress</option>
                    <option value="Delivered">Delivered </option>
                    <option value="deleted">Deleted</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row" style="margin-bottom:80px;">

        <div class="col-sm-12">
            <table class="table {{$Theme['table-size']}}" id="tblorders">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">Customer Name</th>
                        <th class="text-center">Amount</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">Ordered Date</th>
                        <th class="text-center">Action</th>
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
            let TicketFor = "Vendor";
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
                Table=$('#tblorders').dataTable({
                    "bProcessing": true,
                    deferRender: true,
				    responsive: true,
                    dom: 'Bfrtip',
                    "searching": true,
                    "info": false,
                    "order": [[ 0, "desc" ]],
                    "iDisplayLength": 10,
                    "lengthMenu": [[20,  50,100,250], [10, 25, 50,100,250]],
                    "bServerSide": true,
                    createdRow: function (row, data, index) {
                        $(row).addClass('btnDetails');
                        $(row).attr('id',data[0]);
                        /*let t2=$(row).children()[0];
                        let t=data[0].split('-');
                        t2.innerHTML="#"+t[1].replace(/^0+/, '');*/
                    },
                    "ajax": {"url":"{{url('/')}}/admin/orders/data?_token="+$('meta[name=_token]').attr('content'),"headers":{ 'X-CSRF-Token' : "{{ csrf_token() }}" },data:data ,"type": "POST"},
                    buttons: [],
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
                window.location.replace("{{url('/')}}/admin/orders/edit/"+ $(this).attr('data-id'));
            });
            init_DataTable();
        });
    </script>
@endsection
