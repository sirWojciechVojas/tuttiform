@php
$page = $form->title;
($view_type === 'preview') and $page .= ' - Preview*';
$module = ($view_type === 'preview') ? 'My Form' : config('app.name');

$fields = $form->fields()->filled()->get();
$resvals = $form->resvals;


@endphp

@section('title', "{$module} | {$page}")

@extends('layouts.auth')

@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-flat">
            <div class="panel-heading">
                <h5 class="panel-title">{{ $page }}</h5>
            </div>

            @if ($form->status === App\Form::STATUS_CLOSED)
                <div class="panel-body">
                    {{ optional($form->availability)->closed_form_message ?? 'Sorry, this form has been closed to responses.' }}
                </div>
            @else
                <div class="panel-body">
                    {!! str_convert_line_breaks($form->description) !!}
                </div>

                <div class="panel-body">
                    <form id="user-form" action="{{ ($view_type === 'form') ? route('forms.responses.store', $form->code) : '#' }}" method="{{ ($view_type === 'form') ? "post" : "get" }}" autocomplete="off">
                        @if ($view_type === 'form') @csrf @endif
                        <div id="form-fields" class="mt-15 mb-15">
                            @php $formatted_fields = []; @endphp
                            @if ($fields->count())
                                {{-- <p class="content-group text-danger"><strong>Fields with * are required</strong></p> --}}
                                {{-- <pre>
                                    @php print_r($fields) @endphp
                                </pre> --}}
                                @foreach ($fields as $field)
                                    @php $template = get_form_templates($field->template) @endphp
                                    <div class="field" data-id="{{ $field->id }}" data-attribute="{{ $field->attribute }}" data-attribute-type="{{ $template['attribute_type'] === 'string' ? 'single' : 'multiple' }}">
                                        {!! $template['main_template'] !!}
                                    </div>
                                    @php
                                        $only_attributes = ['attribute', 'template', 'question', 'required', 'options'];
                                        $formatted_fields[$field->attribute] = $field->only($only_attributes);
                                    @endphp
                                    @if (explode('.', $field->attribute)[0]=='checkboxes')
                                        @foreach ($resvals as $resval)
                                            @php
                                                $only_att_resvals = ['sel_type', 'field_limit', 'custom_text'];
                                                $ffid=$resval->form_field_id;
                                                $formatted_resvals[$resval->form_field_id] = $resval->only($only_att_resvals);
                                            @endphp
                                        @endforeach
                                    @endif
                                @endforeach
                            @endif
                        </div>
                        @php
                            //$addAttr = ' data-toggle="modal" data-target="#exampleModal"';
                            $btnName = ($view_type === 'form' && empty($only_att_resvals)) ? 'Submit Form' : 'Next';
                            $addAttr = ($view_type === 'form' && empty($only_att_resvals)) ? null : ' data-toggle=modal data-target=#exampleModal';
                        @endphp

                        <div class="text-left mt-20">
                            <button id="submit" type="{{ ($view_type === 'form' && empty($only_att_resvals)) ? 'submit' : 'button' }}" class="btn btn-primary disabled" disabled="true" data-loading-text="Please Wait..." data-complete-text="Submit Form"{{ $addAttr }}>{{ $btnName }}</button>
                        </div>


                    </form>
                </div>
            @endif
    </div>
</div>
@endsection
@section('modalBox')
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-center" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body sortable-container">
          ...
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Submit Form</button>
        </div>
      </div>
    </div>
  </div>
@endsection
@section('walidator')
<div class="row walid vcenter">
    <div class="col-md-9">
        <div>Zaznaczono: <span>0</span> utworów</div>
        <div>Pozostało: <span>{{ $formatted_resvals[$resval->form_field_id]['field_limit'] }}<input type="hidden" value="{{ $formatted_resvals[$resval->form_field_id]['field_limit'] }}"/></span> utworów</div>
        <div>Warunek spełniony</div>
        <div>{{ $formatted_resvals[$resval->form_field_id]['custom_text'] }} <span>{{ $formatted_resvals[$resval->form_field_id]['field_limit'] }}</span></div>
    </div>
</div>
@endsection

@if ($form->status === App\Form::STATUS_OPEN)
    @section('plugin-scripts')
        <script src="{{ asset('assets/js/plugins/uniform.min.js') }}"></script>
        <script src="{{ asset('assets/js/plugins/autosize.min.js') }}"></script>
        <script src="{{ asset('assets/js/plugins/noty.min.js') }}"></script>
        <script src="{{ asset('assets/js/plugins/ion_rangeslider.min.js') }}"></script>
        <script src="{{ asset('assets/js/plugins/pickadate/picker.js') }}"></script>
        <script src="{{ asset('assets/js/plugins/pickadate/picker.date.js') }}"></script>
        <script src="{{ asset('assets/js/plugins/pickadate/picker.time.js') }}"></script>
        <script src="{{ asset('assets/js/plugins/pickadate/legacy.js') }}"></script>
        <script src="{{ asset('assets/js/plugins/select2.min.js') }}"></script>
        <script src="{{ asset('assets/js/plugins/validation/validate.min.js') }}"></script>
        <script src="{{ asset('assets/js/plugins/validation/additional-methods.min.js') }}"></script>

        <script src="{{ asset('assets/js/plugins/jquery.barrating.js') }}"></script>

        @endsection

        @section('page-script')
        <script src="{{ asset('assets/js/custom/pages/validation.js') }}"></script>
        @include('forms.partials._script-view')
    @endsection
@endif
