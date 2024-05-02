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
    tbody td {
        text-align: center !important;
    }
</style>
<div class="card container-fluid mt-100 pt-40">
    @if($crud['add']==1)
        <div class="row" style="margin-bottom:80px;">
            <div class="col-sm-12 text-right">
                <button type="button" id="btnNewTicket" class="btn btn-outline-success btn-min-width box-shadow-2 round">New Ticket</button>
            </div>
        </div>
    @endif
    <div class="row  d-flex justify-content-center mb-20">
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
                    @foreach($users as $user)
                        <option value="{{ $user->CustomerID }}">{{ $user->CustomerName ?? $user->nick_name }} - {{ $user->MobileNo1 }}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="col-sm-2">
                            <div class="form-group text-center mh-60">
                                <label style="margin-bottom:0px;">Priority</label>
                                <select class="form-control" id="lstFPriority">
                                    <option value="">All</option>
                                    <option value="High">High</option>
                                    <option value="Medium">Medium</option>
                                    <option value="Low">Low</option>
                                </select>
                            </div>
                        </div>
        <div class="col-sm-2">
            <div class="form-group text-center mh-60">
                <label style="margin-bottom:0px;">Status</label>
                <select class="form-control" id="lstStatus">
                    <option value="">All</option>
                    <option value="open">Open</option>
                    <option value="unattend ">Unattend </option>
                    <option value="closed">Closed</option>
                    <option value="deleted">Deleted</option>
                </select>
            </div>
        </div>
    </div>
    <div class="row SupportTicket" style="margin-bottom:80px;">
        <div class="col-sm-12">
            <table class="table" id="tblrequests">
                <thead>
                    <tr>
                        <th class="text-center">ID</th>
                        <th class="text-center">User Name</th>
                        <th class="text-center">Subjects</th>
                        <th class="text-center">Type</th>
                        <!--<th class="text-center">Priority</th>-->
                        <th class="text-center">Status</th>
                        <th class="text-center">Creation Date</th>
                        <th class="text-center"></th>
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
                    Priority:$('#lstFPriority').val(),
                    User:$('#lstUser').val(),
                    Status:$('#lstStatus').val()
                }
                Table=$('#tblrequests').dataTable({
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
                    "ajax": {"url":"{{url('/')}}/admin/support/data?_token="+$('meta[name=_token]').attr('content'),"headers":{ 'X-CSRF-Token' : $('meta[name=_token]').attr('content') },data:data ,"type": "POST"},
                    buttons: [], 
                });
            }
            $('#btnReload').click(function(){
                $('#tblrequests').DataTable().ajax.reload();
            });
            $('#lstStatus').change(function(){
                init_DataTable();
            });
            $('#lstFPriority').change(function(){
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
            $(document).on('click','.btnDetails',function(e){
                var CID=$(this).attr('id');
                let t=$(e.target);
                if((t.hasClass('SupportTicketReopen')==false)&&(t.hasClass('SupportTicketDelete')==false)&&(t.hasClass('SupportTicketClose')==false)){
                    window.location.replace("{{url('/')}}/admin/support/details/"+CID);
                }
                //
            });
            $(document).on('click','.SupportTicketReopen',function(){
                var CID=$(this).attr('data-id');
                $.ajax({
                    type:"post",
                    url:"{{url('/')}}/admin/support/activate/"+CID,
                    headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') },
                    success:function(response){
                        $('#tblrequests').DataTable().ajax.reload();
                    }
                });
            });
            $(document).on('click','.SupportTicketClose',function(){
                var CID=$(this).attr('data-id');
                $.ajax({
                    type:"post",
                    url:"{{url('/')}}/admin/support/deactivate/"+CID,
                    headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') },
                    success:function(response){
                        $('#tblrequests').DataTable().ajax.reload();
                    }
                });
            });
            $(document).on('click','.SupportTicketDelete',function(){
                var CID=$(this).attr('data-id');
                swal({
                    title: "Are you sure?",
                    text: "You want Delete this!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-danger",
                    confirmButtonText: "Yes, delete it!",
                    closeOnConfirm: false
                },
                function(){
                    $.ajax({
                        type:"post",
                        url:"{{url('/')}}/admin/support/delete/"+CID,
                        headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') },
                        success:function(response){
                            $('#tblrequests').DataTable().ajax.reload();
                            swal.close();
                        }
                    });
                });
            });
            $('#btnNewTicket').click(function(e){
                e.preventDefault();
                $.ajax({
                    type:"post",
                    url:"{{url('/')}}/admin/support/new-ticket",
                    headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') },
                    success:function(response){
                        if(response!=""){
                            bootbox.dialog({
                                title: 'Support',
                                size:'large',
                                closeButton: true,
                                message: response,
                                buttons: {
                                }
                            });
                        }
                    }
                })
            });
            
            $(document).on('change','#lstTicketFor',function(){
                TicketFor = $(this).val();
                if(TicketFor == 'Vendor'){
                    $('#divCustomer').addClass('d-none');
                    $('#divVendor').removeClass('d-none');
                }else{
                    $('#divVendor').addClass('d-none');
                    $('#divCustomer').removeClass('d-none');
                }
            });
            
            init_DataTable();
        });
    </script>
@endsection