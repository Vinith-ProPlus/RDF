<div class="row mb-30  d-flex justify-content-center">
    <div class="col-sm-6">
        <input type="file" class="Mdropify" id="txtMPCImage" data-allowed-file-extensions="<?php echo implode(" ",$FileTypes['category']['Images']) ?>" >
        <div class="errors new-category" id="txtMPCImage-err"></div>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
        <div class="form-group">
            <label for="lstMPCategoryType"> Product Category Type <span class="required"> * </span>
{{--                <span class="addOption" id="btnReloadMPCategoryType" title="Reload Product Category Type"><i--}}
{{--                        class="fa fa-refresh"></i></span>--}}
            </label>
            <select class="form-control {{$Theme['input-size']}} select2 lstMPCategoryType" id="lstMPCategoryType"
                    data-selected="{{ $PCTID ?? '' }}">
                <option value="">-- Select Product Category Type --</option>
                @foreach($PCategoryType as $row)
                    <option @if($row->PCTID == ($PCTID ?? '')) selected @endif value="{{ $row->PCTID }}">{{ $row->PCTName }}</option>
                @endforeach
            </select>
            <div class="errors" id="lstMPCategoryType-err"></div>
        </div>
    </div>
    <div class="col-sm-12 mt-20">
        <div class="form-group">
            <label class="txtMPCName"> Product Category Name <span class="required"> * </span></label>
            <input type="text" class="form-control  {{$Theme['input-size']}}" id="txtMPCName" value="">
            <div class="errors new-category" id="txtMPCName-err"></div>
        </div>
    </div>
    @if(count($languages) > 0)
        <div class="col-sm-12 text-center mt-20">
            <label class="align-middle fw-bold">Product Category Name Translations</label>
            @foreach($languages as $index=>$language)
                <div class="form-group text-left mt-20">
                    <label class="txtMPCNameIn_{{ $language->code }}">Product Category Name
                        In {{ $language->name_in_english }}<span class="required"> * </span></label>
                    <input type="text"
                           class="form-control PcMLanguageFieldsCheck {{$Theme['input-size']}}"
                           id="txtMPCNameIn_{{ $language->code }}"
                           data-language-code="{{ $language->code }}"
                           data-language="{{ $language->name_in_english }}" value="" autocomplete="off">
                    <div class="errors" id="txtMPCNameIn_{{ $language->code }}-err"></div>
                </div>
            @endforeach
        </div>
    @endif
    <div class="col-sm-12 mt-20">
        <div class="form-group">
            <label class="lstMActiveStatus">Active Status</label>
            <select class="form-control {{$Theme['input-size']}}" id="lstMActiveStatus">
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
        <button class="btn {{$Theme['button-size']}} btn-outline-success btn-air-success" id="btnCreatePCategory">Create</button>
    </div>
</div>
<script>
    $(document).ready(function(){
        $('.Mdropify').dropify();
        {{--const getCategoryType=async()=>{--}}
        {{--    $('#lstMPCategoryType option').remove();--}}
        {{--    $('#lstMPCategoryType').append('<option value="" selected>Select a Product Category Type</option>');--}}
        {{--    $.ajax({--}}
        {{--        type:"post",--}}
        {{--        url:"{{url('/')}}/admin/master/product/category/get/PCategoryType",--}}
        {{--        headers: { 'X-CSRF-Token' : $('meta[name=_token]').attr('content') },--}}
        {{--        dataType:"json",--}}
        {{--        async:true,--}}
        {{--        beforeSend:async()=>{--}}
        {{--            $('#btnReloadMPCategoryType i').addClass('fa-spin');--}}
        {{--        },--}}
        {{--        error:function(e, x, settings, exception){ajaxErrors(e, x, settings, exception);},--}}
        {{--        complete: function(e, x, settings, exception){--}}
        {{--            setTimeout(() => {--}}
        {{--                $('#btnReloadMPCategoryType i').removeClass('fa-spin');--}}
        {{--            }, 500);--}}
        {{--        },--}}
        {{--        success: function (response) {--}}
        {{--            for (let Item of response) {--}}
        {{--                let selected = "";--}}
        {{--                if (Item.PCTID === $('#lstMPCategoryType').attr('data-selected')) {--}}
        {{--                    selected = "selected";--}}
        {{--                }--}}
        {{--                $('.lstMPCategoryType').append('<option ' + selected + ' value="' + Item.PCTID + '">' + Item.PCTName + ' </option>');--}}
        {{--            }--}}
        {{--        }--}}
        {{--    });--}}
        {{--    $('.lstMPCategoryType').select2({--}}
        {{--        dropdownParent: $('.dynamicValueModal')--}}
        {{--    });--}}
        {{--}--}}
        // getCategoryType();

        $('.lstMPCategoryType').select2({
            dropdownParent: $('.dynamicValueModal')
        });

        // $(document).on('click', '#btnReloadMPCategoryType', function() {
        //     getCategoryType();
        // });
    });
</script>
