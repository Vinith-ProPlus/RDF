
<div class="row mb-30  d-flex justify-content-center">
    <div class="col-sm-6">
        <input type="file" class="Mdropify" id="txtMPSCImage" data-allowed-file-extensions="<?php echo implode(" ",$FileTypes['category']['Images']) ?>" >
        <div class="errors new-category" id="txtMPSCImage-err"></div>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="form-group">
            <label class="txtMPSCName"> Product Sub Category Name <span class="required"> * </span></label>
            <input type="text" class="form-control  {{$Theme['input-size']}}" id="txtMPSCName" value="">
            <div class="errors new-category" id="txtMPSCName-err"></div>
        </div>
    </div>
    @if(count($languages) > 0)
        <div class="col-sm-12 text-center mt-20">
            <label class="align-middle fw-bold">Product Sub Category Name Translations</label>
            @foreach($languages as $index=>$language)
                <div class="form-group text-left mt-20">
                    <label class="txtMPSCNameIn_{{ $language->code }}">Product Sub Category Name
                        In {{ $language->name_in_english }}<span class="required"> * </span></label>
                    <input type="text"
                           class="form-control PscMLanguageFieldsCheck {{$Theme['input-size']}}"
                           id="txtMPSCNameIn_{{ $language->code }}"
                           data-language-code="{{ $language->code }}"
                           data-language="{{ $language->name_in_english }}"
                           value="" autocomplete="off">
                    <div class="errors" id="txtMPSCNameIn_{{ $language->code }}-err"></div>
                </div>
            @endforeach
        </div>
    @endif
    <div class="col-sm-12 mt-20">
        <div class="form-group">
            <label class="lstMPCategoryType"> Product Category Type Name <span class="required"> * </span></label>
            <select class="form-control {{$Theme['input-size']}} select2" id="lstMPCategoryType">
                <option value="">-- Select Product Category Type --</option>
                @foreach($PCategoryType as $row)
                <option @if($row->PCTID == ($PCTID ?? '')) selected @endif value="{{ $row->PCTID }}">{{ $row->PCTName }}</option>
                @endforeach
            </select>
            <div class="errors new-category" id="lstMPCategoryType-err"></div>
        </div>
    </div>
    <div class="col-sm-12 mt-20">
        <div class="form-group">
            <label class="lstMPCategory"> Product Category Name <span class="required"> * </span></label>
            <select class="form-control  {{$Theme['input-size']}} select2" id="lstMPCategory">
                <option value="">-- Select Product Category--</option>
                @foreach($PCategory as $row)
                <option @if($row->PCID == $PCID) selected @endif value="{{$row->PCID}}">{{$row->PCName}}</option>
                @endforeach
            </select>
            <div class="errors new-category" id="lstMPCategory-err"></div>
        </div>
    </div>
    <div class="col-sm-12 mt-20">
        <div class="form-group">
            <label class="lstMActiveStatus"> Active Status</label>
            <select class="form-control  {{$Theme['input-size']}}" id="lstMActiveStatus">
                <option value="Active">Active</option>
                <option value="Inactive">Inactive</option>
            </select>
            <div class="errors new-category" id="lstMActiveStatus-err"></div>
        </div>
    </div>
</div>
<div class="row mt-20">
    <div class="col-sm-12 col-12 text-right">
        <button id="btnCloseModal" class="btn btn-outline-dark {{$Theme['button-size']}} mr-10">Close</button>
        <button class="btn {{$Theme['button-size']}} btn-outline-success btn-air-success" id="btnCreatePSubCategory">Create</button>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('.Mdropify').dropify();
        $('#lstMPCategoryType').select2({
            dropdownParent: $('.bootbox-body')
        });
        $('#lstMPCategory').select2({
            dropdownParent: $('.bootbox-body')
        });
    });
</script>
