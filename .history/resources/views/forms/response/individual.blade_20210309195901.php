@php
    $response = $responses->first();
    $response_data = $response->getQuestionAnswerMap();
@endphp

<div class="panel panel-white">
    <div class="panel-heading">
        <h6 class="panel-title">Submitted: <small>{{ $response->created_at->format('jS F, Y g:i a') }} ({{ $response->created_at->diffForHumans() }})</small></h6>
        <div class="heading-elements">
            {{ $responses->appends(['type' => 'individual'])->onEachSide(2)->links('vendor.pagination.panel-header', ['pagination_class' => 'pagination-flat pagination-sm position-left']) }}

            @if (!empty($response_data))
                <a href="javascript:void(0)" id="delete-button" data-href="{{ route('forms.responses.destroy.single', [$form->code, $response->id]) }}" data-item="form response" class="btn btn-sm btn-danger position-right">Delete Response</a>
            @endif
        </div>
    </div>

    <div class="panel-body">
        @foreach ($response_data as $data)
			<div class="row">
				<div class="col-md-12">
					<label class="label-xlg">{{ $data['question'] }}
						@if ($data['required']) <span class="text-danger">*</span> @endif
                    </label>
                    @php
						$value = '';
						if ($data['answer']) {
                            if ($data['template'] === 'linear-scale') {
                                $options = $data['options'];
                                $min_label = !empty($options['min']['label']) ? ": {$options['min']['label']}" : '';
                                $max_label = !empty($options['max']['label']) ? ": {$options['max']['label']}" : '';

                                $range = "(Between {$options['min']['value']}{$min_label} and {$options['max']['value']}{$max_label})";
                                $value = "Rating of {$data['answer']} {$range}";
                            } else {
                                $value = $data['answer'];
                                if(is_array($value)){
                                    $answer = exlode(',',$value);
                                    $rating = exlode(',', $data['rating']);
                                }
                                else $answer=$rating=null;
                            }
						} else {
							$value = 'NIL';
						}
                    @endphp
                    @if ($rating!==null)
                    @foreach ($answer as $elKey => $element)
                    <div class="form-control-static form-underline pb-5">
                        <span>{!! $element !!}</span>
                        <b>- {!! $rating[$elKey] !!} pkt.</b>
                    </div>
                    @endforeach
                    @else
                    <div class="form-control-static form-underline pb-5">{!! $value !!}</div>
                    @endif
                </div>
			</div>
        @endforeach
    </div>
</div>
