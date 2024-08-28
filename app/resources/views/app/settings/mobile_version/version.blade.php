@extends('layouts.app')
@section('content')
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/') }}" data-original-title="" title=""><i class="f-16 fa fa-home"></i></a></li>
                        <li class="breadcrumb-item">Settings</li>
                        <li class="breadcrumb-item">Mobile Version</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row d-flex justify-content-center">
            <div class="col-12 col-sm-12 col-lg-8">
                <div class="card">
                    <div class="card-header text-center"><h5 class="mt-10">{{$PageTitle}}</h5></div>
                    <div class="card-body">
                        <div class="row">
                            <div class="row mb-30 d-flex justify-content-center">
                                <div class="col-sm-6">
                                    <input type="file" class="dropify imageScrop" data-aspect-ratio="{{$Settings['image-crop-ratio']['w']/$Settings['image-crop-ratio']['h']}}" data-remove="0" data-is-cover-image="1" id="txtVersionLogo" data-default-file="<?php if($isEdit==true){if($EditData->logo!=""){ echo url('/')."/".$EditData->logo;}}?>"  data-allowed-file-extensions="<?php echo implode(" ",$FileTypes['category']['Images']) ?>" >
                                    <div class="errors" id="txtVersionLogo-err"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 my-2">
                                    <div class="form-group">
                                        <label for="txtTitle">Title <span class="required"> * </span></label>
                                        <input type="text" class="form-control {{$Theme['input-size']}}" id="txtTitle" value="{{$EditData->title ?? ''}}">
                                        <div class="errors" id="txtTitle-err"></div>
                                    </div>
                                </div>
                                <div class="col-sm-12 my-2">
                                    <div class="form-group">
                                        <label for="txtDescription">Description <span class="required"> * </span></label>
                                        <textarea class="form-control {{$Theme['input-size']}}" id="txtDescription" rows="3">{{$EditData->description ?? ''}}</textarea>
                                        <div class="errors" id="txtDescription-err"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6 my-2">
                                    <div class="form-group">
                                        <label for="txtCurrentVersion">Current Version</label>
                                        <input type="text" class="form-control version-input {{$Theme['input-size']}}" id="txtCurrentVersion" value="{{$EditData->current_version ?? 0}}">
                                        <div class="errors" id="txtCurrentVersion-err"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6 my-2">
                                    <div class="form-group">
                                        <label for="txtNewVersion">New Version<span class="required"> * </span></label>
                                        <input type="text" class="form-control version-input {{$Theme['input-size']}}" id="txtNewVersion" value="{{$EditData->new_version ?? 0}}">
                                        <div class="errors" id="txtNewVersion-err"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6 my-2">
                                    <div class="form-group">
                                        <label for="txtAndroidLink">Android Link</label>
                                        <input type="text" class="form-control {{$Theme['input-size']}}" id="txtAndroidLink" value="{{$EditData->android_link ?? ''}}">
                                        <div class="errors" id="txtAndroidLink-err"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6 my-2">
                                    <div class="form-group">
                                        <label for="txtIosLink">IOS Link</label>
                                        <input type="text" class="form-control {{$Theme['input-size']}}" id="txtIosLink" value="{{$EditData->ios_link ?? ''}}">
                                        <div class="errors" id="txtIosLink-err"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6 my-2">
                                    <div class="form-group">
                                        <label for="txtSubmitText">Submit Text<span class="required"> * </span></label>
                                        <input type="text" class="form-control {{$Theme['input-size']}}" id="txtSubmitText" value="{{$EditData->submit_text ?? ''}}">
                                        <div class="errors" id="txtSubmitText-err"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6 my-2">
                                    <div class="form-group">
                                        <label for="txtIgnoreText">Ignore Text<span class="required"> * </span></label>
                                        <input type="text" class="form-control {{$Theme['input-size']}}" id="txtIgnoreText" value="{{$EditData->ignore_text ?? '' }}">
                                        <div class="errors" id="txtIgnoreText-err"></div>
                                    </div>
                                </div>
                                <div class="col-sm-6 my-2">
                                    <div class="form-group">
                                        <label for="lstUpdateType">Force Update <span class="required"> * </span></label>
                                        <select class="form-control" id="lstUpdateType">
                                            <option value="Normal" {{ $EditData->update_type ? (($EditData->update_type == "Normal") ? 'selected' : '') : '' }}>Normal</option>
                                            <option value="Force" {{ $EditData->update_type ? (($EditData->update_type == "Force") ? 'selected' : '') : '' }}>Force</option>
                                        </select>
                                        <span class="errors MAddress" id="lstUpdateType-err"></span>
                                    </div>
                                </div>
                                <div class="col-sm-6 my-2">
                                    <div class="form-group">
                                        <label for="lstUpdateTo">Update To <span class="required"> * </span></label>
                                        <select class="form-control" id="lstUpdateTo">
                                            <option value="Android and IOS" {{ $EditData->update_to ? (($EditData->update_to == "Android and IOS") ? 'selected' : '') : '' }}>Android and IOS</option>
                                            <option value="Android" {{ $EditData->update_to ? (($EditData->update_to == "Android") ? 'selected' : '') : '' }}>Android</option>
                                            <option value="IOS" {{ $EditData->update_to ? (($EditData->update_to == "IOS") ? 'selected' : '') : '' }}>IOS</option>
                                        </select>
                                        <span class="errors MAddress" id="lstUpdateTo-err"></span>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-sm-12 text-right">
                                @if((($crud['add']==true) && ($crud['edit']==true) && ($isEdit==true)))
                                    <button class="btn {{$Theme['button-size']}} btn-outline-success btn-air-success" id="btnSave">Update</button>
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

    <!-- Image Crop Script Start -->
    <script>
        $(document).ready(function() {
            var uploadedImageURL;
            var URL = window.URL || window.webkitURL;
            var $dataRotate = $('#dataRotate');
            var $dataScaleX = $('#dataScaleX');
            var $dataScaleY = $('#dataScaleY');
            var options = {
                aspectRatio: 16/9,
                preview: '.img-preview'
            };
            var $image = $('#ImageCrop').cropper(options);
            $('#ImgCrop').modal({backdrop: 'static',keyboard: false});
            $('#ImgCrop').modal('hide');
            $(document).on('change', '.imageScrop', function() {
                let id = $(this).attr('id');
                $('#'+id).attr('data-remove',0);
                if($('#'+id).attr('data-aspect-ratio')!=undefined){
                    options.aspectRatio=$('#'+id).attr('data-aspect-ratio')
                }
                $image.attr('data-id', id);
                $('#ImgCrop').modal('show');
                var files = this.files;
                if (files && files.length) {
                    file = files[0];
                    if (/^image\/\w+$/.test(file.type)) {
                        uploadedImageName = file.name;
                        uploadedImageType = file.type;
                        if (uploadedImageURL) {
                            URL.revokeObjectURL(uploadedImageURL);
                        }
                        uploadedImageURL = URL.createObjectURL(file); console.log(options)
                        $image.cropper('destroy').attr('src', uploadedImageURL).cropper(options);
                    } else {
                        window.alert('Please choose an image file.');
                    }
                }
            });
            $('.docs-buttons').on('click', '[data-method]', function() {
                var $this = $(this);
                var data = $this.data();
                var cropper = $image.data('cropper');
                var cropped;
                var $target;
                var result;
                if (cropper && data.method) {
                    data = $.extend({}, data);
                    if (typeof data.target !== 'undefined') {
                        $target = $(data.target);
                        if (typeof data.option === 'undefined') {
                            try {
                                data.option = JSON.parse($target.val());
                            } catch (e) {
                                console.log(e.message);
                            }
                        }
                    }
                    cropped = cropper.cropped;
                    switch (data.method) {
                        case 'rotate':
                            if (cropped && options.viewMode > 0) {
                                $image.cropper('clear');
                            }
                            break;
                        case 'getCroppedCanvas':
                            if (uploadedImageType === 'image/jpeg') {
                                if (!data.option) {
                                    data.option = {};
                                }
                                data.option.fillColor = '#fff';
                            }
                            break;
                    }
                    result = $image.cropper(data.method, data.option, data.secondOption);
                    switch (data.method) {
                        case 'rotate':
                            if (cropped && options.viewMode > 0) {
                                $image.cropper('crop');
                            }
                            break;
                        case 'scaleX':
                        case 'scaleY':
                            $(this).data('option', -data.option);
                            break;
                        case 'getCroppedCanvas':
                            if (result) {
                                $('#getCroppedCanvasModal').modal().find('.modal-body').html(result);
                                if (!$download.hasClass('disabled')) {
                                    download.download = uploadedImageName;
                                    $download.attr('href', result.toDataURL(uploadedImageType));
                                }
                            }
                            break;
                    }
                }
            });
            $('#inputImage').change(function() {
                var files = this.files;
                var file;
                if (!$image.data('cropper')) {
                    return;
                }
                if (files && files.length) {
                    file = files[0];
                    if (/^image\/\w+$/.test(file.type)) {
                        uploadedImageName = file.name;
                        uploadedImageType = file.type;
                        if (uploadedImageURL) {
                            URL.revokeObjectURL(uploadedImageURL);
                        }
                        uploadedImageURL = URL.createObjectURL(file);
                        $image.cropper('destroy').attr('src', uploadedImageURL).cropper(options);
                        $('#inputImage').val('');
                    } else {
                        window.alert('Please choose an image file.');
                    }
                }
            });
            $(document).on('click', '#btnUploadImage', function() {
                $('#inputImage').trigger('click')
            });
            $("#btnCropApply").on('click', function() {
                btnLoading($('#btnCropApply'));
                setTimeout(() => {
                    var base64 = $image.cropper('getCroppedCanvas').toDataURL();
                    var id = $image.attr('data-id');
                    $('#' + id).attr('src', base64);
                    $('#' + id).parent().find('img').attr('src', base64)
                    $('#ImgCrop').modal('hide');
                    setTimeout(() => {
                        btnReset($('#btnCropApply'));
                    }, 100);
                }, 100);
            });
            $(document).on('click','#btnCropModelClose',function(){
                var id = $image.attr('data-id');
                $('#' + id).val("");
                $('#' + id).attr('src', "");
                $('#' + id).parent().find('img').attr('src', "");
                $('#' + id).parent().find('.dropify-clear').trigger('click');
                $('#ImgCrop').modal('hide');
            });
        });
    </script>
    <!-- Image Crop Script End -->
    <script>
        $(document).ready(function(){
            $(".version-input").on("keyup", function() {
                var cleanedValue = $(this).val().replace(/[^0-9.]/g, '');
                $(this).val(cleanedValue);
            });

            const formValidation=()=>{
                $('.errors').html('');
                let status=true;
                let title=$('#txtTitle').val();
                let txtDescription=$('#txtDescription').val();
                let txtCurrentVersion=$('#txtCurrentVersion').val();
                let txtNewVersion=$('#txtNewVersion').val();
                let txtAndroidLink=$('#txtAndroidLink').val();
                let txtIosLink=$('#txtIosLink').val();
                let txtSubmitText=$('#txtSubmitText').val();
                let txtIgnoreText=$('#txtIgnoreText').val();
                let lstUpdateType=$('#lstUpdateType').val();
                let lstUpdateTo=$('#lstUpdateTo').val();

                if(title==""){
                    $('#txtTitle-err').html('The Title is required.');status=false;
                }else if(title.length<2){
                    $('#txtTitle-err').html('Title must be greater than 2 characters');status=false;
                }else if(title.length>100){
                    $('#txtTitle-err').html('Title may not be greater than 100 characters');status=false;
                }
                if(txtDescription==""){
                    $('#txtDescription-err').html('The Description is required.');status=false;
                }else if(txtDescription.length<2){
                    $('#txtDescription-err').html('Description must be greater than 2 characters');status=false;
                }else if(txtDescription.length>100){
                    $('#txtDescription-err').html('Description may not be greater than 100 characters');status=false;
                }
                if(txtNewVersion==""){
                    $('#txtNewVersion-err').html('The New Version is required.');status=false;
                }
                if(txtSubmitText==""){
                    $('#txtSubmitText-err').html('The Submit Text is required.');status=false;
                }else if(txtSubmitText.length<2){
                    $('#txtSubmitText-err').html('Submit Text must be greater than 2 characters');status=false;
                }else if(txtSubmitText.length>20){
                    $('#txtSubmitText-err').html('Submit Text may not be greater than 20 characters');status=false;
                }
                if(txtIgnoreText==""){
                    $('#txtIgnoreText-err').html('The Ignore Text is required.');status=false;
                }else if(txtIgnoreText.length<2){
                    $('#txtIgnoreText-err').html('Ignore Text must be greater than 2 characters');status=false;
                }else if(txtIgnoreText.length>20){
                    $('#txtIgnoreText-err').html('Ignore Text may not be greater than 20 characters');status=false;
                }
                if(lstUpdateType==""){
                    $('#lstUpdateType-err').html('The Update type is required.');status=false;
                }
                if(lstUpdateTo==""){
                    $('#lstUpdateTo-err').html('The Update to is required.');status=false;
                }

                if(status==false){$("html, body").animate({ scrollTop: 0 }, "slow");}
                return status;
            }
            const getData = async () => {
                let tmp = await UploadImages();
                let formData = new FormData();

                formData.append('title',$('#txtTitle').val());
                formData.append('description',$('#txtDescription').val());
                formData.append('current_version',$('#txtCurrentVersion').val());
                formData.append('new_version',$('#txtNewVersion').val());
                formData.append('android_link',$('#txtAndroidLink').val());
                formData.append('ios_link',$('#txtIosLink').val());
                formData.append('submit_text',$('#txtSubmitText').val());
                formData.append('ignore_text',$('#txtIgnoreText').val());
                formData.append('update_type',$('#lstUpdateType').val());
                formData.append('update_to',$('#lstUpdateTo').val());

                formData.append('removeVersionLogo', $('#txtVersionLogo').attr('data-remove'));

                if (tmp.coverImage.uploadPath !== "") {
                    formData.append('VersionLogo', JSON.stringify(tmp.coverImage));
                }

                return formData;
            };

            $(document).on('click','.dropify-clear',function(){
                $(this).parent().find('input[type="file"]').attr('data-remove',1);
            });
            $('#btnSave').click(function(){
                let status=formValidation();
                if(status){
                    swal({
                        title: "Are you sure?",
                        text: "You want @if($isEdit==true)Update @else Save @endif this Mobile version update!",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonClass: "btn-outline-success",
                        confirmButtonText: "Yes, @if($isEdit==true)Update @else Save @endif it!",
                        closeOnConfirm: false
                    },async function(){
                        swal.close();
                        const formData=await getData();
                        btnLoading($('#btnSave'));
                        let postUrl="{{url('/')}}/admin/settings/mobile_version/update";
                        $.ajax({
                            type:"post",
                            url:postUrl,
                            headers: { 'X-CSRF-Token' : "{{ csrf_token() }}" },
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
                            complete: function(e, x, settings, exception){btnReset($('#btnSave'));ajaxIndicatorStop();$("html, body").animate({ scrollTop: 0 }, "slow");},
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
                                        window.location.reload();
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
                                            if(key=="Title"){$('#txtTitle-err').html(KeyValue);}
                                            if(key=="VersionLogo"){$('#txtVersionLogo-err').html(KeyValue);}
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
