
<div class="row mb-30  d-flex justify-content-center">
    <div class="col-sm-6">
        <input type="file" class="Mdropify" id="txtMPCTImage" data-allowed-file-extensions="<?php echo implode(" ",$FileTypes['category']['Images']) ?>" >
        <div class="errors new-category" id="txtMPCTImage-err"></div>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="form-group">
            <label class="txtMPCTName"> Product Category Type Name <span class="required"> * </span></label>
            <input type="text" class="form-control {{$Theme['input-size']}}" id="txtMPCTName" value="">
            <div class="errors new-category" id="txtMPCTName-err"></div>
        </div>
    </div>
    @if(count($languages) > 0)
        <div class="col-sm-12 text-center mt-20">
            <label class="align-middle fw-bold">Product Category Type Name Translations</label>
            @foreach($languages as $index=>$language)
                <div class="form-group text-left mt-20">
                    <label class="txtMPCTNameIn_{{ $language->code }}">Product Category Type Name
                        In {{ $language->name_in_english }}<span class="required"> * </span></label>
                    <input type="text" class="form-control CtLanguageFieldsCheck {{$Theme['input-size']}}"
                           id="txtMPCTNameIn_{{ $language->code }}"
                           data-language-code="{{ $language->code }}" data-language="{{ $language->name_in_english }}"
                           value="" autocomplete="off">
                    <div class="errors" id="txtMPCTNameIn_{{ $language->code }}-err"></div>
                </div>
            @endforeach
        </div>
    @endif
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
        <button class="btn {{$Theme['button-size']}} btn-outline-success btn-air-success" id="btnCreatePCategoryType">Create</button>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('.Mdropify').dropify();
    });
</script>
