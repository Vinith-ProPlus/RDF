@extends('layouts.app')
@section('content')
<div class="container-fluid">
	<div class="page-header">
		<div class="row">
			<div class="col-sm-12">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="{{ url('/') }}" data-original-title="" title=""><i class="f-16 fa fa-home"></i></a></li>
					<li class="breadcrumb-item">Product Master</li>
					<li class="breadcrumb-item"><a href="{{ url('/') }}/admin/master/product/attributes/" data-original-title="" title="">{{$PageTitle}}</a></li>
                    <li class="breadcrumb-item">@if($isEdit==true)Update @else Create @endif</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row d-flex justify-content-center">
		<div class="col-12 col-sm-12 col-lg-9">
			<div class="card">
				<div class="card-header text-center"><h5 class="mt-10">{{$PageTitle}}</h5></div>
				<div class="card-body">
                    <div class="row">
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label class="txtAttrName">Attribute Name <span class="required"> * </span></label>
                                <input type="text" class="form-control  {{$Theme['input-size']}}" id="txtAttrName" value="<?php if($isEdit==true){ echo $EditData[0]->AttrName;} ?>" autocomplete="off">
                                <div class="errors" id="txtAttrName-err"></div>
                            </div>
                        </div>
                        <div class="col-sm-12 mt-20">
                            <div class="form-group">
                                <label class="txtValues">Value <span class="required"> * </span></label>
                                <div class="input-group">
                                    <input type="text" class="form-control  {{$Theme['input-size']}}" id="txtValues">
                                    <button class="input-group-text btn-outline-primary px-4 position-relative" id="btnAddAttrValue"><i class="fa fa-plus"></i></button>
                                </div>
                                <div class="errors" id="txtValues-err"></div>
                            </div>
                        </div>
                        @if(count($languages) > 0)
                            <div class="col-sm-12 text-center mt-20">
                                <label class="align-middle fw-bold">Value Name Translations</label>
                                @foreach($languages as $index=>$language)
                                    <div class="form-group text-left mt-10">
                                        <label class="txtAttrValueIn_{{ $language->code }}">Value
                                            In {{ $language->name_in_english }}<span class="required"> * </span></label>
                                        <input type="text"
                                               class="form-control AttValueLanguageFieldsCheck AttValueLanguageFieldsClear {{$Theme['input-size']}}"
                                               id="txtAttrValueIn_{{ $language->code }}"
                                               data-language-code="{{ $language->code }}"
                                               data-language="{{ $language->name_in_english }}"
                                               value=""
                                               autocomplete="off">
                                        <div class="errors" id="txtAttrValueIn_{{ $language->code }}-err"></div>
                                    </div>
                                @endforeach
                            </div>
                        @endif
                        <div class="col-sm-12 text-center mt-20" id="divAttrValues">
                            <label class="align-middle fw-bold">Attribute details</label>
                            @if($isEdit)
                                @foreach($EditValuesData as $Key=>$row)
                                    <?php $AcnIndex = $Key + 1; ?>
                                    <div class="col-sm-12 divAttrValHead" id="divAttrValHead{{$AcnIndex}}">
                                        <div class="row mt-10">
                                            <div class="col-sm-12">
                                                <div class="accordion" id="accordion{{$AcnIndex}}">
                                                    <div class="accordion-item">
                                                        <h2 class="accordion-header" id="heading{{$AcnIndex}}">
                                                            <button class="accordion-button collapsed" type="button" id="accordionTrigger{{$AcnIndex}}" data-bs-toggle="collapse" data-bs-target="#collapse{{$AcnIndex}}" aria-expanded="false" aria-controls="collapse{{$AcnIndex}}">
                                                                <div class="d-flex justify-content-between align-items-center w-100">
                                                                    <div class="divExistingValue" id="divExistingValue{{$AcnIndex}}" data-value-id="{{$row->ValueID}}">{{$row->Values}}</div>
                                                                    <span class="trash btnDeleteAttrValue mr-10"><i class="fa fa-trash"></i></span>
                                                                </div>
                                                            </button>
                                                        </h2>
                                                        <div id="collapse{{$AcnIndex}}" class="accordion-collapse collapse" aria-labelledby="heading{{$AcnIndex}}" data-bs-parent="#divAttrValues">
                                                            <div class="accordion-body">
                                                                <div class="row">
                                                                    <div class="col-sm-12">
                                                                        <div class="row mb-10 d-flex justify-content-center d-none">
                                                                            <div class="col-sm-10 col-10 col-lg-4 text-center">
                                                                                <label class="txtValueLogo{{$AcnIndex}}"> Logo </label>
                                                                                <input type="file" class="dropify imageScrop"
                                                                                       data-aspect-ratio="{{$Settings['profile-image-crop-ratio']['w']/$Settings['profile-image-crop-ratio']['h']}}"
                                                                                       data-remove="0" id="txtValueLogo{{$AcnIndex}}" data-default-path="@if($isEdit && $row->ValueLogo){{$row->ValueLogo}}@endif"
                                                                                       data-default-file="<?php if($isEdit){if($row->ValueLogo!=""){ echo url('/')."/".$row->ValueLogo;}}?>"
                                                                                       data-slno="{{$row->Values}}" data-allowed-file-extensions="<?php echo implode(" ",$FileTypes['category']['Images']) ?>" >
                                                                                <div class="errors Vendors err-sm" id="txtValueLogo{{$AcnIndex}}-err"></div>
                                                                            </div>
                                                                        </div>
                                                                        @if(count($languages) > 0)
                                                                        <div class="row mb-10 d-flex justify-content-center">
                                                                            @foreach($languages as $index=>$language)
                                                                                <div class="col-sm-6 col-6 col-lg-6 text-center">
                                                                                    <label class="txtValueAccTranslation_{{$AcnIndex}}">Value in {{ $language->name_in_english }}:</label>
                                                                                    <input type="text" name="AccTranslation_{{$AcnIndex}}_{{$index}}" class="form-control {{$Theme['input-size']}} AttTranslationAcc{{$AcnIndex}}"
                                                                                           data-language="{{ $language->name_in_english }}" data-language-code="{{ $language->code }}" value="{{ $row ? ($row->valuesInTranslation->{$language->code} ?? '') : '' }}">
                                                                                    <div class="errors translations err-sm" id="txtAccAttrValueIn_{{ $AcnIndex }}_{{ $language->code }}-err"></div>
                                                                                </div>
                                                                            @endforeach
                                                                        </div>
                                                                        @endif
                                                                        <div class="row mt-20 divPCategoryInputs{{$AcnIndex}}">
                                                                            <div class="col-sm-4">
                                                                                <div class="form-group">
                                                                                    <label for="lstPCategory{{$AcnIndex}}">Product Category <span class="required"> * </span></label>
                                                                                    <select class="form-control  {{$Theme['input-size']}} select2 lstPCategory" id="lstPCategory{{$AcnIndex}}" data-id="{{$AcnIndex}}" data-selected="">
                                                                                        <option value="">Select a Product Category</option>
                                                                                    </select>
                                                                                    <div class="errors PCategories err-sm" id="lstPCategory{{$AcnIndex}}-err"></div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-sm-4">
                                                                                <div class="form-group">
                                                                                    <label for="lstPSubCategory{{$AcnIndex}}"> Product Sub Category <span class="required"> * </span></label>
                                                                                    <select class="form-control  {{$Theme['input-size']}} select2" id="lstPSubCategory{{$AcnIndex}}" data-selected="">
                                                                                        <option value="">Select a Product Sub Category</option>
                                                                                    </select>
                                                                                    <div class="errors PCategories err-sm" id="lstPSubCategory{{$AcnIndex}}-err"></div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-sm-4 d-flex align-items-center justify-content-center">
                                                                                <button type="button" class="btn btn-sm btn-outline-info btnAddCategories" data-id="{{$AcnIndex}}">Add</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row mt-20">
                                                                    <div class="col-sm-12">
                                                                        <table class="table tblCategories" id="tblCategories{{$AcnIndex}}">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th>Product Category</th>
                                                                                    <th>Product Sub Category</th>
                                                                                    <th>Action</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                @foreach($EditAttrValCtgyData as $item)
                                                                                    @if($item->ValueID == $row->ValueID)
                                                                                        <tr data-map-id="{{$item->DetailID}}">
                                                                                            <td>{{$item->PCName}}</td>
                                                                                            <td data-id="{{$item->PSCID}}">{{$item->PSCName}}</td>
                                                                                            <td><button type="button" class="btn btn-sm btn-outline-danger btnDeleteCategories"><i class="fa fa-trash"></i></button></td>
                                                                                            <td class="d-none">{{ json_encode(['PCID' => $item->PCID, 'PSCID' => $item->PSCID]) }}</td>
                                                                                        </tr>
                                                                                    @endif
                                                                                @endforeach
                                                                            </tbody>
                                                                        </table>
                                                                        <div class="errors PCategories err-sm" id="tblCategories{{$AcnIndex}}-err"></div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                @endforeach
                            @endif
                        </div>
                    </div>
                    <div class="row mt-20">
                        <div class="col-sm-12 text-right">
                            @if($crud['view'])
                            <a href="{{url('/')}}/admin/master/product/attributes" class="btn {{$Theme['button-size']}} btn-outline-dark mr-10" id="btnCancel">Back</a>
                            @endif

                            @if((($crud['add']) && (!$isEdit))||($crud['edit'] && $isEdit))
                                <button class="btn {{$Theme['button-size']}} btn-outline-success" id="btnSave">@if($isEdit) Update @else Save @endif</button>
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
                    uploadedImageURL = URL.createObjectURL(file);
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
                            // console.log(e.message);
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

        // Add Attribute Values

        let AcnIndex = $('.divAttrValHead .divAttrValHead').length + 1;
        const ValuesExistingValidation=async(data)=>{
            $('.errors').html('');
            let status=true;
            let lowerCaseData = data.toLowerCase();
            $('.divAttrValHead:not(".d-none") .divExistingValue').each(function(){
                let ExistingValue = $(this).html().toLowerCase().trim();
                if(ExistingValue == lowerCaseData){
                    $("#txtValues-err").html('This Value exists');status=false;
                    return false;
                }
            });
            if(status===false){$("html, body").animate({ scrollTop: 0 }, "slow");}
            return status;
        }

        const createAccordion = async (Value, translations) => {
            var accordionContent = `
                <div class="col-sm-12 divAttrValHead" id="divAttrValHead${AcnIndex}">
                    <div class="row mt-10">
                        <div class="col-sm-12">
                            <div class="accordion" id="accordion${AcnIndex}">
                                <div class="accordion-item">
                                    <h2 class="accordion-header" id="heading${AcnIndex}">
                                        <button class="accordion-button collapsed" type="button" id="accordionTrigger${AcnIndex}" data-bs-toggle="collapse" data-bs-target="#collapse${AcnIndex}" aria-expanded="false" aria-controls="collapse${AcnIndex}">
                                            <div class="d-flex justify-content-between align-items-center w-100">
                                                <div class="divExistingValue" id="divExistingValue${AcnIndex}" data-value-id="">${Value}</div>
                                                <span class="trash btnDeleteAttrValue mr-10"><i class="fa fa-trash"></i></span>
                                            </div>
                                        </button>
                                    </h2>
                                    <div id="collapse${AcnIndex}" class="accordion-collapse collapse" aria-labelledby="heading${AcnIndex}" data-bs-parent="#divAttrValues">
                                        <div class="accordion-body">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="row mb-10 d-flex justify-content-center d-none">
                                                        <div class="col-sm-10 col-10 col-lg-4 text-center">
                                                            <label class="txtValueLogo${AcnIndex}"> Logo </label>
                                                            <input type="file" class="dropify imageScrop" data-aspect-ratio="{{$Settings['profile-image-crop-ratio']['w']/$Settings['profile-image-crop-ratio']['h']}}" data-remove="0" id="txtValueLogo${AcnIndex}" data-default-path="" data-default-file="" data-slno="${Value}" data-allowed-file-extensions="<?php echo implode(" ",$FileTypes['category']['Images']) ?>" >
                                                            <div class="errors Vendors err-sm" id="txtValueLogo${AcnIndex}-err"></div>
                                                        </div>
                                                    </div>
                                                    <div class="row mb-10 d-flex justify-content-center">
                                                         ${translations.map((translation, index) => `
                                                        <div class="col-sm-6 col-6 col-lg-6 text-center">
                                                            <label class="txtValueAccTranslation_${AcnIndex}">Value in ${translation.language}:</label>
                                                            <input type="text" name="AccTranslation_${AcnIndex}_${index}" class="form-control {{$Theme['input-size']}} AttTranslationAcc${AcnIndex}" data-language="${translation.language}" data-language-code="${translation.language_code}" value="${translation.value}">
                                                            <div class="errors translations err-sm" id="txtAccAttrValueIn_${AcnIndex}_${translation.language_code}-err"></div>
                                                        </div>`).join('')}
                                                    </div>
                                                    <div class="row mt-20 divPCategoryInputs${AcnIndex}">
                                                        <div class="col-sm-4">
                                                            <div class="form-group">
                                                                <label for="lstPCategory${AcnIndex}">Product Category <span class="required"> * </span></label>
                                                                <select class="form-control  {{$Theme['input-size']}} select2 lstPCategory" id="lstPCategory${AcnIndex}" data-id="${AcnIndex}" data-selected="">
                                                                    <option value="">Select a Product Category</option>
                                                                </select>
                                                                <div class="errors PCategories err-sm" id="lstPCategory${AcnIndex}-err"></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4">
                                                            <div class="form-group">
                                                                <label for="lstPSubCategory${AcnIndex}"> Product Sub Category <span class="required"> * </span></label>
                                                                <select class="form-control  {{$Theme['input-size']}} select2" id="lstPSubCategory${AcnIndex}" data-selected="">
                                                                    <option value="">Select a Product Sub Category</option>
                                                                </select>
                                                                <div class="errors PCategories err-sm" id="lstPSubCategory${AcnIndex}-err"></div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-4 d-flex align-items-center justify-content-center">
                                                            <button type="button" class="btn btn-sm btn-outline-info btnAddCategories" data-id="${AcnIndex}">Add</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-20">
                                                <div class="col-sm-12">
                                                    <table class="table tblCategories" id="tblCategories${AcnIndex}">
                                                        <thead>
                                                            <tr>
                                                                <th>Product Category</th>
                                                                <th>Product Sub Category</th>
                                                                <th>Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        </tbody>
                                                    </table>
                                                    <div class="errors PCategories err-sm" id="tblCategories${AcnIndex}-err"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            `;
            $("#divAttrValues").append(accordionContent);
            $('.select2').select2();
            getPCategory(AcnIndex);
            $('.dropify').dropify();
            $('#txtValues').val('');
            $('.AttValueLanguageFieldsClear').val('');
            AcnIndex++;
        };

        $("#btnAddAttrValue").on("click", async function () {
            let AttrName = $('#txtAttrName').val();
            let Value = $('#txtValues').val();
            let status = await ValuesExistingValidation(Value);
            if (AttrName === "") {
                $('#txtAttrName-err').html('Attr Name is required');
                status = false;
            } else if (AttrName.length < 3) {
                $('#txtAttrName-err').html('Attribute Name must be greater than 2 characters');
                status = false;
            } else if (AttrName.length > 100) {
                $('#txtAttrName-err').html('Attribute Name may not be greater than 100 characters');
                status = false;
            }
            if (Value === "") {
                $('#txtValues-err').html('Value is required');
                status = false;
            }

            let translations = [];
            $('.AttValueLanguageFieldsCheck').each(function() {
                let input = $(this);
                let value = input.val();
                let languageCode = input.data('language-code');
                let language = input.data('language');

                if (value === "") {
                    $('#txtAttrValueIn_' + languageCode + '-err').html('The Value in ' + language + ' is required.');
                    status = false;
                } else {
                    $('#txtAttrValueIn_' + languageCode + '-err').html('');
                    translations.push({language: language, language_code: languageCode, value: value});
                }
            });

            if (status) {
                createAccordion(Value, translations);
            }
        });

        $(document).on('click', '.btnDeleteAttrValue', function (e) {
            e.stopPropagation();
            let $clickedElement = $(this);
            let ValueName = $clickedElement.closest('div').find(".divExistingValue").text();
            swal({
                title: "Are you sure?",
                text: "You want to Delete " + ValueName + " Attribute Value!",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-outline-danger",
                confirmButtonText: "Yes, Delete it!",
                closeOnConfirm: false
            }, function (status) {
                if (status) {
                    swal.close();
                    $clickedElement.closest(".divAttrValHead").addClass('d-none');
                }
            });
            // $(this).closest(".divAttrValHead").addClass('d-none');
        });
        $("#txtValues").keydown(function (event) {
            if (event.keyCode === 13) {
                $("#btnAddAttrValue").click();
            }
        });


        //Add Categories

        const getPCategory=async(i)=>{
            $('#lstPCategory'+i).select2('destroy');
            $('#lstPCategory'+i+' option').remove();
            $('#lstPCategory'+i).append('<option value="" selected>Select a Product Category</option>');
            $.ajax({
                type:"post",
                url:"{{url('/')}}/admin/master/product/category/get/PCategory",
                headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') },
                dataType:"json",
                async:true,
                error:function(e, x, settings, exception){ajaxErrors(e, x, settings, exception);},
                complete: function(e, x, settings, exception){},
                success:function(response){
                    for(let Item of response){
                        let selected="";
                        if(Item.PCID==$('#lstPCategory'+i).attr('data-selected')){selected="selected";}
                        $('#lstPCategory'+i).append('<option '+selected+' value="'+Item.PCID+'">'+Item.PCName+' </option>');
                    }
                }
            });
            $('#lstPCategory'+i).select2();
            if($('#lstPCategory'+i).val()!=""){
                $('#lstPCategory'+i).trigger('change');
            }
        }
        const getPSubCategory=async(i)=>{
            let PCID = $('#lstPCategory'+i).val();
            $('#lstPSubCategory'+i).select2('destroy');
            $('#lstPSubCategory'+i+' option').remove();
            $('#lstPSubCategory'+i).append('<option value="" selected>Select a Product Sub Category</option>');
            $.ajax({
                type:"post",
                url:"{{url('/')}}/admin/master/product/sub-category/get/PSubCategory",
                headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') },
                dataType:"json",
                data : {PCID : PCID},
                async:true,
                error:function(e, x, settings, exception){ajaxErrors(e, x, settings, exception);},
                complete: function(e, x, settings, exception){},
                success:function(response){
                    for(let Item of response){
                        let selected="";
                        if(Item.PSCID==$('#lstPSubCategory'+i).attr('data-selected')){selected="selected";}
                        $('#lstPSubCategory'+i).append('<option '+selected+' value="'+Item.PSCID+'">'+Item.PSCName+' </option>');
                    }
                }
            });
            $('#lstPSubCategory'+i).select2();
        }
        const CategoriesExistingValidation=async(data,i)=>{
            let status=true;
            let lowerCaseData = data.trim();
            $('#tblCategories'+i+' tbody tr:not(".d-none")').each(function(){
                let ExistingValue = $(this).find('td:eq(1)').attr('data-id').trim();
                if(ExistingValue === lowerCaseData){
                    $("#lstPSubCategory"+i+"-err").html('This Sub Category exists');status=false;
                    return false;
                }
            });
            return status;
        }
        $(document).on('click','.btnAddCategories',async function(){
            $('.errors.PCategories').html('');
            let status = true;
            let i = $(this).attr('data-id');
            let FormData ={
                PCategory : $('#lstPCategory'+i).val(),
                PSubCategory : $('#lstPSubCategory'+i).val(),
            }
            if (FormData.PCategory=="") {
                $('#lstPCategory'+i+'-err').html('Product Category is required');status = false;
            }else{
                FormData.PCategoryName=$('#lstPCategory'+i+' option:selected').text();
            }
            if (FormData.PSubCategory=="") {
                $('#lstPSubCategory'+i+'-err').html('Product Sub Category is required');status = false;
            }else{
                FormData.PSubCategoryName=$('#lstPSubCategory'+i+' option:selected').text();
            }
            if(status){
                status = await CategoriesExistingValidation(FormData.PSubCategory,i);
            }
            if(status){
				let html='<tr data-map-id="">';
					html+='<td>'+FormData.PCategoryName+'</td>';
					html+='<td data-id="'+FormData.PSubCategory+'">'+FormData.PSubCategoryName+'</td>';
					html+='<td><button type="button" class="btn btn-sm btn-outline-danger btnDeleteCategories"><i class="fa fa-trash"></i></button></td>';
                    html+= '<td class="d-none">'+JSON.stringify({PCID:FormData.PCategory,PSCID:FormData.PSubCategory})+'</td>';
    				html+='</tr>';
				$('#tblCategories'+i+' tbody').append(html);
                $('#lstPCategory'+i).val('').trigger('change');
			}
        });
        $(document).on('click', '.btnDeleteCategories', function () {
            $(this).closest("tr").addClass('d-none');
		});
        $(document).on('change','.lstPCategory',function(){
            let i = $(this).attr('data-id');
            getPSubCategory(i);
		});


        //Save

        const formValidation=()=>{
            $('.errors').html('');
            let status=true;
            let AttrName=$('#txtAttrName').val();
            let ValuesLength=$('#divAttrValues .divAttrValHead:not(".d-none")').length;
            if (AttrName === "") {
                $('#txtAttrName-err').html('Attribute Name is required.');
                status = false;
            } else if (AttrName.length < 3) {
                $('#txtAttrName-err').html('Attribute Name must be greater than 2 characters');
                status = false;
            } else if (AttrName.length > 100) {
                $('#txtAttrName-err').html('Attribute Name may not be greater than 100 characters');
                status = false;
            }
            if (ValuesLength === 0) {
                $("#txtValues-err").html('Add a Value');
                status = false;
            }

            for (let i = 1; i < AcnIndex; i++) {
                if ($('#divAttrValHead' + i + ':not(".d-none")').length) {
                    let translationsComplete = true;
                    $('.AttTranslationAcc' + i).each(function () {
                        let input = $(this);
                        let value = input.val();
                        let language = input.data('language');
                        let languageCode = input.data('language-code');

                        if (value === "") {
                            $('#txtAccAttrValueIn_' + i + '_' + languageCode + '-err').html('The Value in ' + language + ' is required.');
                            translationsComplete = false;
                        }
                    });

                    if (!translationsComplete) {
                        status = false;
                        if (!$('#collapse' + i).hasClass('show')) {
                            $('#accordionTrigger' + i).trigger('click');
                        }
                        break;
                    }

                    if ($('#tblCategories' + i + ' tbody tr:not(".d-none")').length === 0) {
                        $("#tblCategories" + i + "-err").html('Add a Product Category and Sub Category');
                        status = false;
                        if (!$('#collapse' + i).hasClass('show')) {
                            $('#accordionTrigger' + i).trigger('click');
                        }
                        break;
                    }
                }
            }

            // if(status==false){$("html, body").animate({ scrollTop: 0 }, "slow");}
            return status;
        };
        const getData=async()=>{
            let tmp=await UploadImages();
            let formData=new FormData();
            formData.append('AttrName',$('#txtAttrName').val());
            formData.append('ActiveStatus','Active');
            let Values = {
                ExistingValues: [],
                DeletedValueIDs: [],
            };
            for (let i = 1; i < AcnIndex; i++) {
                if ($('#divAttrValHead' + i + ':not(".d-none")').length) {
                    let AttValueInTranslation = {};

                    $('.AttTranslationAcc' + i).each(function() {
                        let input = $(this);
                        let language_code = input.data('language-code');
                        AttValueInTranslation[language_code] = input.val();
                    });
                    let existingValue = {
                        ValueName: $('#divExistingValue' + i).text(),
                        ValueID: $('#divExistingValue' + i).attr('data-value-id'),
                        valuesInTranslation: JSON.stringify(AttValueInTranslation),
                        CategoryData: {
                            Categories: {
                                DetailID:"",
                                CategoryIDs:[],
                            },
                            DeletedDetailIDs: [],
                        },
                        ValueLogo:{
                            isLogoRemoved : $("#txtValueLogo"+i).attr('data-remove'),
                            existingLogoPath : $("#txtValueLogo"+i).attr('data-default-path'),
                        }
                    };

                    if ($('#tblCategories' + i + ' tbody tr').length) {
                        $('#tblCategories' + i + ' tbody tr').each(function () {
                            if (!$(this).hasClass('d-none')) {
                                existingValue.CategoryData.Categories.DetailID=$(this).attr('data-map-id');
                                existingValue.CategoryData.Categories.CategoryIDs.push(JSON.parse($(this).find('td:eq(3)').text()));
                            } else {
                                if($(this).attr('data-map-id')){
                                    existingValue.CategoryData.DeletedDetailIDs.push($(this).attr('data-map-id'));
                                }
                            }
                        });
                    }


                    tmp.gallery.forEach(function (item) {
                        if (item.slno === existingValue.ValueName) {
                            existingValue.ValueLogo.uploadPath= item.uploadPath;
                            existingValue.ValueLogo.fileName= item.fileName;
                        }
                    });

                    Values.ExistingValues.push(existingValue);
                } else {
                    if($('#divExistingValue' + i).attr('data-value-id')){
                        Values.DeletedValueIDs.push($('#divExistingValue' + i).attr('data-value-id'));
                    }
                }
            }
            formData.append('VData', JSON.stringify(Values));
            return formData;
        }
        $('#btnSave').click(async function(){
            let status=formValidation();
            if(status){
                let formData=await getData();
                swal({
                    title: "Are you sure?",
                    text: "You want @if($isEdit)Update @else Save @endif this Attribute!",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: "btn-outline-success",
                    confirmButtonText: "Yes, @if($isEdit)Update @else Save @endif it!",
                    closeOnConfirm: false
                },function(){
                    swal.close();
                    btnLoading($('#btnSave'));
                    let postUrl=@if($isEdit) "{{url('/')}}/admin/master/product/attributes/edit/{{$EditData[0]->AttrID}}"; @else "{{url('/')}}/admin/master/product/attributes/create"; @endif
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
                        complete: function(e, x, settings, exception){btnReset($('#btnSave'));ajaxIndicatorStop();$("html, body").animate({ scrollTop: 0 }, "slow");},
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
                                    @if($isEdit==true)
                                        window.location.replace("{{url('/')}}/admin/master/product/attributes");
                                    @else
                                        window.location.reload();
                                    @endif

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
                                        if(key=="AttrName"){$('#txtAttrName-err').html(KeyValue);}
                                        if(key=="ShortName"){$('#txtShortName-err').html(KeyValue);}
                                        if(key=="PhoneCode"){$('#txtPhoneCode-err').html(KeyValue);}
                                    });
                                }
                            }
                        }
                    });
                });
            }
        });
        $(document).on('click','.dropify-clear',function(){
            $(this).parent().find('input[type="file"]').attr('data-remove',1);
        });
        const appInit=async()=>{
            @if($isEdit)
                AcnIndex = {{count($EditValuesData) + 1}};
                for(let i = 1; i < AcnIndex; i++) {
                    getPCategory(i);
                }
            @endif
        }
        appInit();
    });
</script>
@endsection
