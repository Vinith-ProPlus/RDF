@extends('layouts.app')
@section('content')
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-sm-12">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="{{ url('/') }}" data-original-title="" title=""><i
                                    class="f-16 fa fa-home"></i></a></li>
                        @if($isEdit)
                            <li class="breadcrumb-item"><a href="{{ url('/') }}/admin/users-and-permissions/profile"
                                                           data-original-title="" title="">{{$PageTitle}}</a></li>
                            <li class="breadcrumb-item">Edit</li>
                        @else
                            <li class="breadcrumb-item">Profile</li>
                        @endif
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row d-flex justify-content-center">
            <div class="col-sm-9">
                <div class="card">
                    <div class="card-header text-center"><h5 class="mt-10" id="pageTitle">{{$PageTitle}}</h5></div>
                    <div class="card-body ">
                        <div class="row">
                            <div class="col-sm-12">
                                <form class="form-wizard" id="Leads" action="#" method="POST">
                                    <div class="tab" data-page="{{$PageTitle}}" style="{{ $isEdit ? '' : 'pointer-events: none !important;' }}">
                                        <div class="row mb-30  d-flex justify-content-center">
                                            <div class="col-sm-4">
                                                <input type="file" class="dropify imageScrop"
                                                       data-aspect-ratio="{{$Settings['image-crop-ratio']['w']/$Settings['image-crop-ratio']['h']}}"
                                                       data-remove="0" data-is-cover-image="1" id="txtProfiImage"
                                                       data-default-file="{{ ($EditData->ProfileImage!="") ? url('/')."/profile_images/".$EditData->ProfileImage : '' }}"
                                                       data-allowed-file-extensions="<?php echo implode(" ",$FileTypes['category']['Images']) ?>">
                                                <div class="errors" id="txtProfileImage-err"></div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-6 mt-20">
                                                <div class="form-group">
                                                    <label class="txtUserId">User ID </label>
                                                    <input type="text" class="form-control {{$Theme['input-size']}}" id="txtUserId"
                                                           value="{{ $EditData->UserID ?? '' }}" {{ $isEdit ? '' : 'readonly' }}>
                                                    <div class="errors" id="txtUserId-err"></div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mt-20">
                                                <div class="form-group">
                                                    <label for="txtRoleID">User Role <span
                                                            class="required">*</span></label>
                                                        <input type="text" class="form-control  {{$Theme['input-size']}}" id="txtRoleID"
                                                               value="{{ $EditData->user_role->RoleName ?? '' }}" readonly>
                                                    <span class="errors Profi err-sm" id="txtRoleID-err"></span>
                                                </div>
                                            </div>
                                            <div class="col-sm-12 mt-20">
                                                <div class="form-group">
                                                    <label class="txtName">Name </label>
                                                    <input type="text" class="form-control  {{$Theme['input-size']}}" id="txtName"
                                                           value="{{ $EditData->Name ?? '' }}" {{ $isEdit ? '' : 'readonly' }}>
                                                    <div class="errors" id="txtName-err"></div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mt-20">
                                                <div class="form-group">
                                                    <label class="txtFirstName" for="txtFirstName">First Name </label>
                                                    <input type="text" class="form-control  {{$Theme['input-size']}}" id="txtFirstName"
                                                           value="{{ $EditData->FirstName ?? '' }}" {{ $isEdit ? '' : 'readonly' }}>
                                                    <div class="errors" id="txtFirstName-err"></div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mt-20">
                                                <div class="form-group">
                                                    <label class="txtLastName">Last Name </label>
                                                    <input type="text" class="form-control  {{$Theme['input-size']}}" id="txtLastName"
                                                           value="{{ $EditData->LastName ?? '' }}" {{ $isEdit ? '' : 'readonly' }}>
                                                    <div class="errors" id="txtLastName-err"></div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mt-20">
                                                <div class="form-group">
                                                    <label class="txtDOB">DOB </label>
                                                    <input type="date" class="form-control  {{$Theme['input-size']}}" id="txtDOB"
                                                           value="{{ $EditData->DOB ?? '' }}" {{ $isEdit ? '' : 'readonly' }}>
                                                    <div class="errors" id="txtDOB-err"></div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mt-20">
                                                <div class="form-group">
                                                    <label class="txtDOJ">DOJ </label>
                                                    <input type="date" class="form-control  {{$Theme['input-size']}}" id="txtDOJ"
                                                           value="{{ $EditData->DOJ ?? '' }}" {{ $isEdit ? '' : 'readonly' }}>
                                                    <div class="errors" id="txtDOJ-err"></div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mt-20">
                                                <div class="form-group">
                                                    <label for="txtEmail">Email <span class="required">*</span></label>
                                                    <input type="text" id="txtEMail" class="form-control "
                                                           placeholder="Email"
                                                           value="{{ $EditData->EMail ?? '' }}">
                                                    <span class="errors Profile err-sm" id="txtEmail-err"></span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mt-20">
                                                <div class="form-group">
                                                    <label for="txtMobileNumber">Mobile Number <span
                                                            class="required">*</span></label>
                                                    <input type="text" id="txtMobileNumber" class="form-control"
                                                           placeholder="Mobile Number"
                                                           value="{{ $EditData->MobileNumber ?? '' }}">
                                                    <span class="errors Profile err-sm" id="txtMobileNumber-err"></span>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mt-20">
                                                <div class="form-group">
                                                    <label class="txtGenderID">Gender </label>
                                                    @if($isEdit)
                                                        <select class="form-control {{$Theme['input-size']}} select2"
                                                                id="txtGenderID"
                                                                data-selected="{{ $EditData->GenderID ?? '' }}">
                                                            <option value="">Select Gender</option>
                                                            @foreach($genders as $gender)
                                                                <option value="{{ $gender->GID }}" {{ ($gender->GID === $EditData->GenderID) ? 'selected' : '' }}>{{ $gender->Gender }}</option>
                                                            @endforeach
                                                        </select>
                                                    @else
                                                        <input type="text" class="form-control  {{$Theme['input-size']}}" id="txtGenderID"
                                                               value="{{ $EditData->gender->Gender ?? '' }}" readonly>
                                                    @endif
                                                    <div class="errors" id="txtGenderID-err"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab" data-page="Address" style="{{ $isEdit ? '' : 'pointer-events: none !important;' }}">
                                        <div class="row">
                                            <div class="col-sm-12 mt-20">
                                                <label for="txtAddress">Address <span class="required">*</span></label>
                                                <textarea id="txtAddress" rows="3"
                                                          class="form-control" {{ $isEdit ? '' : 'readonly' }}>{{ $EditData->Address ?? '' }}</textarea>
                                                <span class="errors-address err-sm" id="txtAddress-err"></span>
                                            </div>
                                            <div class="col-sm-6 mt-20">
                                                <div class="form-group">
                                                    <label for="txtPostalCode">Postal Code <span
                                                            class="required">*</span></label>
                                                    <div class="input-group">
                                                        <input type="text" id="txtPostalCode" class="form-control"
                                                               placeholder="Postal Code"
                                                               value="{{ $EditData->PostalCode ?? '' }}">
                                                        <button type="button" class="btn btn-outline-dark"
                                                                id="btnGSearchPostalCode">Search <i
                                                                class="fa fa-search"></i></button>
                                                    </div>
                                                    <div class="errors-address err-sm" id="txtPostalCode-err"></div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mt-20">
                                                <div class="form-group">
                                                    <label for="lstCity">City <span class="required">*</span></label>
                                                    <select class="form-control {{$Theme['input-size']}} select2"
                                                            id="lstCity"
                                                            data-selected="{{ $EditData->CityID ?? '' }}">
                                                        <option value="">Select a City</option>
                                                    </select>
                                                    <div class="errors-address err-sm" id="lstCity-err"></div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mt-20">
                                                <div class="form-group">
                                                    <label for="lstTaluk">Taluk <span class="required">*</span></label>
                                                    <select class="form-control {{$Theme['input-size']}} select2"
                                                            id="lstTaluk"
                                                            data-selected="<?php if($isEdit){ echo $EditData->TalukID;} ?>">
                                                        <option value="">Select a Taluk</option>
                                                    </select>
                                                    <div class="errors-address err-sm" id="lstTaluk-err"></div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mt-20">
                                                <div class="form-group">
                                                    <label for="lstDistrict">District <span
                                                            class="required">*</span></label>
                                                    <select class="form-control {{$Theme['input-size']}} select2"
                                                            id="lstDistricts"
                                                            data-selected="{{ $EditData->DistrictID ?? '' }}">
                                                        <option value="">Select a District</option>
                                                    </select>
                                                    <div class="errors-address err-sm" id="lstDistricts-err"></div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mt-20">
                                                <div class="form-group">
                                                    <label for="lstState">State <span class="required">*</span></label>
                                                    <select class="form-control {{$Theme['input-size']}} select2"
                                                            id="lstState"
                                                            data-selected="<?php if($isEdit){ echo $EditData->StateID;} ?>">
                                                        <option value="">Select a State</option>
                                                    </select>
                                                    <div class="errors-address err-sm" id="lstState-err"></div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 mt-20">
                                                <div class="form-group">
                                                    <label for="lstCountry">Country <span
                                                            class="required">*</span></label>
                                                    <select class="form-control {{$Theme['input-size']}} select2"
                                                            id="lstCountry"
                                                            data-selected="<?php if($isEdit){ echo $EditData->CountryID;} ?>">
                                                        <option value="">Select a Country</option>
                                                    </select>
                                                    <div class="errors-address err-sm" id="lstCountry-err"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <hr>
                                    <div class="row mt-30">
                                        <div class="col-sm-6">
                                            <button onclick="window.history.back();"
                                               class="btn btn-sm btn-outline-dark" id="btnCancel">Back</button>
                                                <a class="btn btn-sm btn-outline-info"
                                                        href="{{ url('/') }}/admin/users-and-permissions/profile{{ $isEdit ? '' : '/edit' }}"
                                                        data-original-title="" title="">{{ $isEdit ? 'View' : 'Edit' }}</a>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="text-right btn-mb">
                                                <button class="btn btn-outline-secondary" id="prevBtn" type="button"
                                                        style="display: none;">Previous
                                                </button>
                                                <button class="btn btn-outline-success" id="nextBtn" type="button">
                                                    Next
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center" id="divStepIndicator">
                                        <span class="step active"></span>
                                    </div>
                                </form>
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
        $(document).ready(function () {
            var uploadedImageURL;
            var URL = window.URL || window.webkitURL;
            var $dataRotate = $('#dataRotate');
            var $dataScaleX = $('#dataScaleX');
            var $dataScaleY = $('#dataScaleY');
            var options = {
                aspectRatio: 16 / 9,
                preview: '.img-preview'
            };
            var $image = $('#ImageCrop').cropper(options);
            $('#ImgCrop').modal({backdrop: 'static', keyboard: false});
            $('#ImgCrop').modal('hide');
            $(document).on('change', '.imageScrop', function () {
                let id = $(this).attr('id');
                $('#' + id).attr('data-remove', 0);
                if ($('#' + id).attr('data-aspect-ratio') != undefined) {
                    options.aspectRatio = $('#' + id).attr('data-aspect-ratio')
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
                        uploadedImageURL = URL.createObjectURL(file);
                        console.log(options)
                        $image.cropper('destroy').attr('src', uploadedImageURL).cropper(options);
                    } else {
                        window.alert('Please choose an image file.');
                    }
                }
            });
            $('.docs-buttons').on('click', '[data-method]', function () {
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
            $('#inputImage').change(function () {
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
            $(document).on('click', '#btnUploadImage', function () {
                $('#inputImage').trigger('click')
            });
            $("#btnCropApply").on('click', function () {
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
            $(document).on('click', '#btnCropModelClose', function () {
                var id = $image.attr('data-id');
                $('#' + id).val("");
                $('#' + id).attr('src', "");
                $('#' + id).parent().find('img').attr('src', "");
                $('#' + id).parent().find('.dropify-clear').trigger('click');
                $('#ImgCrop').modal('hide');
            });
            $(document).on('click', '.dropify-clear', function () {
                $(this).parent().find('input[type="file"]').attr('data-remove', 1);
            });

        });
    </script>
    <!-- Image Crop Script End -->
    <script>
        $(document).ready(function () {
            let EditRow = null;
            var currentTab = 0;
            showTab(currentTab);

            function showTab(n) {
                var x = document.getElementsByClassName("tab");
                x[n].style.display = "block";
                if (n == 0) {
                    @if(!$isEdit)
                    $('#nextBtn').show();
                    @endif
                    document.getElementById("prevBtn").style.display = "none";
                } else {
                    document.getElementById("prevBtn").style.display = "inline";
                }
                if (n === (x.length - 1)) {
                    document.getElementById("nextBtn").innerHTML = @if($isEdit) "Update"
                    @else "Edit" @endif;
                    @if(!$isEdit)
                    $('#nextBtn').hide();
                    @endif
                    $('#btnPreview').show();
                } else {
                    document.getElementById("nextBtn").innerHTML = "Next";
                    $('#btnPreview').hide();
                }
                fixStepIndicator(n);
                let page = x[currentTab].getAttribute('data-page');
                $('#pageTitle').html(page);
            }

            async function nextPrev(n) {
                var x = document.getElementsByClassName("tab");
                if (n == 1 && !validateForm()) return false;
                if ((parseInt(currentTab) + parseInt(n)) >= x.length) {
                    Save();
                    return false;
                }
                x[currentTab].style.display = "none";
                currentTab = currentTab + n;
                showTab(currentTab);

            }

            function isValidDateFormat(dateString) {
                var date = new Date(dateString);
                return !isNaN(date.getTime()) && dateString === date.toISOString().split('T')[0];
            }

            function validateForm() {
                let status = true;
                let x = document.getElementsByClassName("tab");
                let page = x[currentTab].getAttribute('data-page');
                if ((page === "Profile")) {
                    $('.errors.Profile').html('');
                    let Name = $('#txtName').val();
                    let FirstName = $('#txtFirstName').val();
                    let LastName = $('#txtLastName').val();
                    let DOB = $('#txtDOB').val();
                    // let DOJ = $('#txtDOJ').val();
                    let GenderID = $('#txtGenderID').val();
                    let MobileNumber = $('#txtMobileNumber').val();
                    let EMail = $('#txtEMail').val();
                    if (!Name) {
                        $('#txtName-err').html('Name is required');
                        status = false;
                    } else if (Name.length < 2) {
                        $('#txtProfileName-err').html('The Name is must be greater than 2 characters.');
                        status = false;
                    } else if (Name.length > 100) {
                        $('#txtProfileName-err').html('The Name is not greater than 100 characters.');
                        status = false;
                    }
                    if (!FirstName) {
                        $('#txtFirstName-err').html('First Name is required');
                        status = false;
                    } else if (FirstName.length < 2) {
                        $('#txtProfileFirstName-err').html('The First Name is must be greater than 2 characters.');
                        status = false;
                    } else if (FirstName.length > 100) {
                        $('#txtProfileFirstName-err').html('The First Name is not greater than 100 characters.');
                        status = false;
                    }
                    if (!LastName) {
                        $('#txtLastName-err').html('Last Name is required');
                        status = false;
                    } else if (LastName.length < 2) {
                        $('#txtProfileLastName-err').html('The Last Name is must be greater than 2 characters.');
                        status = false;
                    } else if (LastName.length > 100) {
                        $('#txtProfileLastName-err').html('The Last Name is not greater than 100 characters.');
                        status = false;
                    }
                    if (!DOB) {
                        $('#txtDOB-err').html('DOB is required');
                        status = false;
                    } else {
                        var isValidDate = isValidDateFormat(DOB);
                        if (!isValidDate) {
                            $('#txtProfileDOB-err').html('Invalid date format for DOB.');
                            status = false;
                        }
                    }
                    // if (!DOJ) {
                    //     $('#txtDOJ-err').html('DOJ is required');
                    //     status = false;
                    // } else {
                    //     var isValidDate = isValidDateFormat(DOJ);
                    //     if (!isValidDate) {
                    //         $('#txtProfileDOJ-err').html('Invalid date format for DOJ.');
                    //         status = false;
                    //     }
                    // }
                    let mobilePattern = /^\d{10}$/;
                    if (!MobileNumber) {
                        $('#txtMobileNumber-err').html('Mobile Number is required.');
                        status = false;
                    } else if (!mobilePattern.test(MobileNumber)) {
                        $("#txtMobileNumber-err").html("Mobile Number must be 10 digit");
                    }
                    let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                    if (!EMail) {
                        $('#txtEMail-err').html('Email is required.');
                        status = false;
                    } else if (!emailPattern.test(EMail)) {
                        $("#txtEMail-err").html("Enter a valid email address");
                        status = false;
                    }
                    if (!GenderID) {
                        $('#txtGenderID-err').html('Gender is required.');
                        status = false;
                    }
                } else if (page === "Address") {
                    $('.errors-address').html('');
                    let Address = $('#txtAddress').val();
                    let PostalCode = $('#lstCity option:selected').attr('data-postal');
                    let CityID = $('#lstCity').val();
                    let TalukID = $('#lstTaluk').val();
                    let DistrictID = $('#lstDistricts').val();
                    let StateID = $('#lstState').val();
                    let CountryID = $('#lstCountry').val();
                    let isAddress = false;
                    if (!PostalCode) {
                        $('#txtPostalCode-err').html('Postal Code is required.');
                        status = false;
                        isAddress = true;
                    }
                    if (CityID == "") {
                        $('#lstCity-err').html('City is required.');
                        status = false;
                        isAddress = true;
                    }
                    if (TalukID == "") {
                        $('#lstTaluk-err').html('Taluk is required.');
                        status = false;
                        isAddress = true;
                    }
                    if (DistrictID == "") {
                        $('#lstDistricts-err').html('District is required.');
                        status = false;
                        isAddress = true;
                    }
                    if (StateID == "") {
                        $('#lstState-err').html('State is required.');
                        status = false;
                        isAddress = true;
                    }
                    if (CountryID == "") {
                        $('#lstCountry-err').html('Country is required.');
                        status = false;
                        isAddress = true;
                    }
                    if (Address == "") {
                        $('#txtAddress-err').html('Address is required.');
                        status = false;
                    } else if (Address.length < 10) {
                        $('#txtAddress-err').html('Address must be greater than 10 characters');
                        status = false;
                        isAddress = true;
                    }
                    if (status == false) {
                        $("html, body").animate({scrollTop: 0}, "slow");
                    }
                }
                return status;
            }

            function fixStepIndicator(n) {
                $('#divStepIndicator').html('');
                var tabs = document.getElementsByClassName("tab");
                for (let i = 0; i < tabs.length; i++) {
                    $('#divStepIndicator').append('<span class="step"></span>');
                }

                var i, x = document.getElementsByClassName("step");
                for (i = 0; i < x.length; i++) {
                    x[i].className = x[i].className.replace(" active", "");
                }
                x[n].className += " active";
            }

            $(document).on('click', '#btnGSearchPostalCode', async function () {
                $('#txtPostalCode-err').html('')
                let PostalCode = $('#txtPostalCode').val();
                if (PostalCode != "") {
                    $('#btnGSearchPostalCode').attr('disabled', 'disabled');
                    $('#btnGSearchPostalCode').html('<i class="fa fa-spinner fa-pulse"></i>');
                    let response = await getCity({PostalCode});
                    if (response.length > 0) {
                        $('#lstCity').select2('destroy');
                        $('#lstCity option').remove();
                        $('#lstCity').append('<option value="">Select a City</option>');
                        for (let Item of response) {
                            let selected = "";
                            if (Item.CityID == $('#lstCity').attr('data-selected')) {
                                selected = "selected";
                            }
                            $('#lstCity').append('<option ' + selected + ' data-postal="' + Item.PostalID + '" data-taluk="' + Item.TalukID + '" data-district="' + Item.DistrictID + '" data-state="' + Item.StateID + '" data-country="' + Item.CountryID + '" data-city-name="' + Item.CityName + '" value="' + Item.CityID + '">' + Item.CityName + ' </option>');
                        }
                        $('#lstCity').select2();
                        if ($('#lstCity').val() != "") {
                            $('#lstCity').trigger('change');
                        }
                    } else {
                        $('#txtPostalCode-err').html('Postal Code does not exists.')
                    }
                    setTimeout(() => {
                        $('#btnGSearchPostalCode').html('Search <i class="fa fa-search"></i>');
                        $('#btnGSearchPostalCode').removeAttr('disabled');
                    }, 100);
                } else {
                    $('#txtPostalCode-err').html('Postal Code is required.')
                }
            });
            $(document).on("change", '#lstCity', function () {
                let CountryID = $('#lstCity option:selected').attr('data-country');
                let StateID = $('#lstCity option:selected').attr('data-state');
                let DistrictID = $('#lstCity option:selected').attr('data-district');
                let TalukID = $('#lstCity option:selected').attr('data-taluk');
                $('#lstTaluk').attr('data-selected', TalukID);
                $('#lstDistricts').attr('data-selected', DistrictID);
                $('#lstState').attr('data-selected', StateID);
                $('#lstCountry').attr('data-selected', CountryID);
                $('#lstCountry').val(CountryID).trigger('change');

                if (!$('.chkServiceBy:checked').length) {
                    $('.chkServiceBy[data-value="PostalCode"]').prop('checked', true).trigger('change');
                    setTimeout(function () {
                    }, 2000)
                }
            });
            $(document).on("change", '#lstDistricts', function () {
                getTaluks({
                    CountryID: $('#lstCountry').val(),
                    StateID: $('#lstState').val(),
                    DistrictID: $('#lstDistricts').val()
                }, 'lstTaluk');
            });
            $(document).on("change", '#lstState', function () {
                getDistricts({CountryID: $('#lstCountry').val(), StateID: $('#lstState').val()}, 'lstDistricts');
            });
            $(document).on("change", '#lstCountry', function () {
                getStates({CountryID: $('#lstCountry').val()}, 'lstState');
            });
            $(document).on('click', '#btnSaveAddress', function () {
                SaveAddress();
            });
            $(document).on('click', '.btnEditSAddress', function () {
                let Row = $(this).closest('tr');
                let EditData = JSON.parse($(this).closest('tr').find("td:eq(3)").html());
                EditData.EditID = Row.attr('id');
                EditData.AID = Row.attr('data-aid');
                getAddressModal(EditData);
            });
            $('#prevBtn').click(function () {
                nextPrev(-1);
            });
            $('#nextBtn').click(function () {
                nextPrev(1);
            });
            @if($isEdit)
            const getData = async () => {
                let tmp = await UploadImages();
                let formData = new FormData();
                formData.append('Name', $('#txtName').val());
                formData.append('FirstName', $('#txtFirstName').val());
                formData.append('LastName', $('#txtLastName').val());
                formData.append('MobileNumber', $('#txtMobileNumber').val());
                formData.append('DOB', $('#txtDOB').val());
                formData.append('DOJ', $('#txtDOJ').val());
                formData.append('EMail', $('#txtEMail').val());
                formData.append('GenderID', $('#txtGenderID').val());
                formData.append('Address', $('#txtAddress').val());
                formData.append('PostalCodeID', $('#lstCity option:selected').attr('data-postal'));
                formData.append('CityID', $('#lstCity').val());
                formData.append('TalukID', $('#lstTaluk').val());
                formData.append('DistrictID', $('#lstDistricts').val());
                formData.append('StateID', $('#lstState').val());
                formData.append('CountryID', $('#lstCountry').val());
                formData.append('removeProfileImage', $('#txtProfileImage').attr('data-remove'));

                if (tmp.coverImage.uploadPath !== "") {
                    formData.append('ProfileImageUrl', JSON.stringify(tmp.coverImage));
                }
                return formData;
            }
            const Save = async () => {
                let formData = await getData();
                swal({
                    title: "Are you sure?",
                    text: "You want Update your Profile!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-outline-success",
                    confirmButtonText: "Yes, Update it!",
                    closeOnConfirm: false
                }, function () {
                    swal.close();
                    btnLoading($('#nextBtn'));
                    $.ajax({
                        type: "POST",
                        url: "{{url('/')}}/admin/users-and-permissions/profile/update",
                        headers: {'X-CSRF-Token': $('meta[name=_token]').attr('content')},
                        data: formData,
                        cache: false,
                        processData: false,
                        contentType: false,
                        error: function (e, x, settings, exception) {
                            console.log(e);
                            // ajax_errors(e, x, settings, exception);
                        },
                        complete: function (e, x, settings, exception) {
                            btnReset($('#nextBtn'));
                            // ajaxindicatorstop();
                            $("html, body").animate({scrollTop: 0}, "slow");
                        },
                        success: function (response) {
                            if (response.status == true) {
                                swal({
                                    title: "SUCCESS",
                                    text: response.message,
                                    type: "success",
                                    showCancelButton: false,
                                    confirmButtonClass: "btn-outline-success",
                                    confirmButtonText: "Okay",
                                    closeOnConfirm: false
                                }, function () {
                                    @if($isEdit==true)
                                    window.location.replace("{{url('/')}}/admin/users-and-permissions/profile");
                                    @else
                                    window.location.reload();
                                    @endif
                                });
                            } else {
                                $('.tab').hide();
                                currentTab = 0;
                                showTab(currentTab);
                                setTimeout(() => {
                                    $('#nextBtn').html('Next');
                                }, 100);
                                toastr.error(response.message, "Failed", {
                                    positionClass: "toast-top-right",
                                    containerId: "toast-top-right",
                                    showMethod: "slideDown",
                                    hideMethod: "slideUp",
                                    progressBar: !0
                                })
                                if (response['errors'] != undefined) {
                                    $('.errors').html('');
                                    $.each(response['errors'], function (KeyName, KeyValue) {
                                        var key = KeyName;
                                        if (key == "EMail") {
                                            $('#txtEMail-err').html(KeyValue);
                                        }
                                        if (key == "MobileNumber") {
                                            $('#txtMobileNumber-err').html(KeyValue);
                                        }
                                        if (key == "ProfileImage") {
                                            $('#txtProfileImage-err').html(KeyValue);
                                        }

                                    });
                                }
                            }
                        }
                    });
                });
            }
            @endif

            const getCity = async (data) => {
                return await new Promise((resolve, reject) => {
                    $.ajax({
                        type: "post",
                        url: "{{url('/')}}/get/city",
                        headers: {'X-CSRF-Token': $('meta[name=_token]').attr('content')},
                        data: data,
                        dataType: "json",
                        async: true,
                        error: function (e, x, settings, exception) {
                            ajaxErrors(e, x, settings, exception);
                            resolve([])
                        },
                        complete: function (e, x, settings, exception) {
                        },
                        success: function (response) {
                            resolve(response)
                        }
                    });
                });
            }
            const getTaluks = async (data, id) => {
                $('#' + id).select2('destroy');
                $('#' + id + ' option').remove();
                $('#' + id).append('<option value="">Select a Taluk</option>');
                $.ajax({
                    type: "post",
                    url: "{{url('/')}}/get/taluks",
                    headers: {'X-CSRF-Token': $('meta[name=_token]').attr('content')},
                    data: data,
                    dataType: "json",
                    async: true,
                    error: function (e, x, settings, exception) {
                        ajaxErrors(e, x, settings, exception);
                        resolve([])
                    },
                    complete: function (e, x, settings, exception) {
                    },
                    success: function (response) {
                        for (let Item of response) {
                            let selected = "";
                            if (Item.TalukID == $('#' + id).attr('data-selected')) {
                                selected = "selected";
                            }
                            $('#' + id).append('<option ' + selected + ' data-taluk=""  value="' + Item.TalukID + '">' + Item.TalukName + ' </option>');
                        }
                        if ($('#' + id).val() != "") {
                            $('#' + id).trigger('change');
                        }
                    }
                });
                $('#' + id).select2();
            }
            const getDistricts = async (data, id) => {
                let Data = [];
                $('#' + id).select2('destroy');
                $('#' + id + ' option').remove();
                $('#' + id).append('<option value="">Select a District</option>');
                $.ajax({
                    type: "post",
                    url: "{{url('/')}}/get/districts",
                    headers: {'X-CSRF-Token': $('meta[name=_token]').attr('content')},
                    data: data,
                    dataType: "json",
                    async: true,
                    error: function (e, x, settings, exception) {
                        ajaxErrors(e, x, settings, exception);
                        resolve([])
                    },
                    complete: function (e, x, settings, exception) {
                    },
                    success: function (response) {
                        for (let Item of response) {
                            let selected = "";
                            if (Item.DistrictID == $('#' + id).attr('data-selected')) {
                                selected = "selected";
                            }
                            $('#' + id).append('<option ' + selected + ' data-taluk=""  value="' + Item.DistrictID + '">' + Item.DistrictName + ' </option>');
                        }
                        if ($('#' + id).val() != "") {
                            $('#' + id).trigger('change');
                        }
                        Data = response;
                    }
                });
                $('#' + id).select2();
                return Data;
            }
            const getStates = async (data, id) => {
                $('#' + id).select2('destroy');
                $('#' + id + ' option').remove();
                $('#' + id).append('<option value="">Select a State</option>');
                $.ajax({
                    type: "post",
                    url: "{{url('/')}}/get/states",
                    headers: {'X-CSRF-Token': $('meta[name=_token]').attr('content')},
                    data: data,
                    dataType: "json",
                    async: true,
                    error: function (e, x, settings, exception) {
                        ajaxErrors(e, x, settings, exception);
                        resolve([])
                    },
                    complete: function (e, x, settings, exception) {
                    },
                    success: function (response) {
                        for (let Item of response) {
                            let selected = "";
                            if (Item.StateID == $('#' + id).attr('data-selected')) {
                                selected = "selected";
                            }
                            $('#' + id).append('<option ' + selected + '  value="' + Item.StateID + '">' + Item.StateName + ' </option>');
                        }
                        if ($('#' + id).val() != "") {
                            $('#' + id).trigger('change');
                        }
                    }
                });
                $('#' + id).select2();
            }
            const getCountry = async (data, id) => {
                $('#' + id).select2('destroy');
                $('#' + id + ' option').remove();
                $('#' + id).append('<option value="">Select a Country</option>');
                $.ajax({
                    type: "post",
                    url: "{{url('/')}}/get/country",
                    headers: {'X-CSRF-Token': $('meta[name=_token]').attr('content')},
                    data: data,
                    dataType: "json",
                    async: true,
                    error: function (e, x, settings, exception) {
                        ajaxErrors(e, x, settings, exception);
                        resolve([])
                    },
                    complete: function (e, x, settings, exception) {
                    },
                    success: function (response) {
                        for (let Item of response) {
                            let selected = "";
                            if (Item.CountryID == $('#' + id).attr('data-selected')) {
                                selected = "selected";
                            }
                            $('#' + id).append('<option ' + selected + ' value="' + Item.CountryID + '">' + Item.CountryName + ' </option>');
                        }
                        if ($('#' + id).val() != "") {
                            $('#' + id).trigger('change');
                        }
                    }
                });
                $('#' + id).select2();
            }
            getCountry({}, 'lstCountry');


        });

        $(document).ready(function () {
            $('#btnGSearchPostalCode').trigger('click');
        });
    </script>
@endsection
