@extends('layouts.app')
@section('content')
    <style>
        th{
            text-align: center !important;
        }
    </style>
<div class="container-fluid">
	<div class="page-header">
		<div class="row">
			<div class="col-sm-12">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="{{ url('/') }}" data-original-title="" title=""><i class="f-16 fa fa-home"></i></a></li>
					<li class="breadcrumb-item">Settings</li>
                    <li class="breadcrumb-item"><a href="{{url('/admin/settings/cms/')}}">{{$PageTitle}}</a></li>
					<li class="breadcrumb-item">Update</li>
				</ol>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row  d-flex justify-content-center ">
		<div class="col-sm-12 ">
			<div class="row">
				<div class="col-sm-12">
					<div class="card">
						<div class="card-header text-center">
							<div class="form-row align-items-center">
								<div class="col-md-4">	</div>
								<div class="col-md-4 my-2"><h5>{{$PageTitle}}</h5></div>
								<div class="col-md-4 my-2 text-right text-md-right">
								</div>
							</div>
						</div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table" style="width: max-content;">
                                    <thead>
                                    <tr>
                                        <th style="width: 500px !important;">Sentence</th>
                                        @foreach($languages as $language)
                                            <th style="width: 500px !important;">{{ "In $language->name_in_english" }}</th>
                                        @endforeach
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($translation_keys as $translation_key)
                                        <tr>
                                            <td>{{ $translation_key->key ?? '' }}</td>
                                            @foreach($languages as $index => $language)
                                                <td>
                                                    <textarea
                                                        class="form-control updateField language-{{$language->id}}"
                                                        data-language-id="{{ "$language->id" }}"
                                                        data-translation-key="{{ $translation_key->key ?? '' }}"
                                                        data-language-code="{{ $language->code }}">{{ trim($language->translations_value->{$translation_key->key} ?? $translation_key->key) }}</textarea>
                                                </td>
                                            @endforeach
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="row">
                                <div class="col-sm-12 text-right">
                                    @if($crud['view'])
                                        <a href="{{url('/')}}/admin/settings/translations/" class="btn btn-sm btn-outline-dark" id="btnCancel">Back</a>
                                    @endif
                                </div>
                            </div>
                        </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection
@section('scripts')
    @if(($crud['view'])&&($crud['edit']))
        <script>
            $(document).ready(function () {
                const getData = async (language_id) => {
                    let translations = {};
                    $('.language-' + language_id).each(function () {
                        translations[$(this).data('translation-key')] = $(this).val().trim();
                    });
                    let jsonTranslation = JSON.stringify(translations);
                    return {
                        language_id: language_id,
                        value: jsonTranslation
                    };
                };

                $('.updateField').on('blur', async function () {
                    let language_id = $(this).data('language-id');
                    const formData = await getData(language_id);
                    $.ajax({
                        type: "POST",
                        url: "{{ route('translation.update') }}",
                        headers: {'X-CSRF-Token': "{{ csrf_token() }}"},
                        data: formData,
                        error: function (e, x, settings, exception) {
                            ajaxErrors(e, x, settings, exception);
                        },
                        complete: function (e, x, settings, exception) {
                            ajaxIndicatorStop();
                        },
                        success: function (response) {
                            if (response.status) {
                                toastr.success(response.message, "Success", {
                                    positionClass: "toast-top-right",
                                    containerId: "toast-top-right",
                                    showMethod: "slideDown",
                                    hideMethod: "slideUp",
                                    progressBar: !0
                                })
                            } else {
                                toastr.error(response.message, "Failed", {
                                    positionClass: "toast-top-right",
                                    containerId: "toast-top-right",
                                    showMethod: "slideDown",
                                    hideMethod: "slideUp",
                                    progressBar: !0
                                })
                            }
                        }
                    });
                });
            });
        </script>
    @endif
@endsection
