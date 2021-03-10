<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Iatstuti\Database\Support\CascadeSoftDeletes;

class FormField extends Model
{
    use SoftDeletes, CascadeSoftDeletes;

    protected $fillable = [
        'form_id', 'template', 'question', 'required', 'options', 'attribute', 'filled'
    ];

    protected $casts = [
        'required' => 'boolean',
        'filled' => 'boolean',
        'options' => 'array',
        'rating' => 'array',
    ];

    protected $cascadeDeletes = ['responses'];

    public function scopeFilled($query)
    {
        return $query->where('filled', true);
    }

    public function form()
    {
        return $this->belongsTo(Form::class);
    }

    public function responses()
    {
        return $this->hasMany(FieldResponse::class);
    }

    public function resvals()
    {
        return $this->hasMany(FormResval::class);
    }

    public function getResponseSummaryDataForChart()
    {
        $responses = $this->responses;

        if ($responses->isEmpty()) {
            return [];
        }

        $use_chart = '';
        $data = [];

        switch ($this->template) {
            case 'drop-down':
            case 'multiple-choices':
            case 'checkboxes':
                $use_chart = ($this->template == 'checkboxes') ? 'h_bar_chart' : 'pie_chart';

                $data[] = ($this->template == 'drop-down')
                    ? ['Option', 'No. of option selected']
                    : ['Choice', 'No. of choice selected'];
                $a=0;
                foreach ($this->options as $option) {
                    if ($this->template == 'checkboxes') {
                        $option_selected_count = $responses->filter(function ($v, $k) use ($option) {
                            $value = (array) json_decode($v->answer);
                            return in_array($option, $value);
                        })->count();
                    } else {
                        $option_selected_count = $responses->where('answer', $option)->count();
                    }

                    // array_push($data, [$option, $rating]);
                    array_push($data, [$option, $option_selected_count]);

                }
                break;

            case 'linear-scale':
                $use_chart = 'v_bar_chart';
                $min = $this->options['min'];
                $max = $this->options['max'];

                $data[] = ['Scale value', 'Count'];

                foreach (range((int) $min['value'], (int) $max['value']) as $value) {
                    $value_selected_counts = $responses->where('answer', $value)->count();

                    array_push($data, [$value, $value_selected_counts]);
                }

                break;
        }

        return [
            'chart' => $use_chart,
            'name' => str_replace('.', '_', $this->attribute),
            'data' => $data
        ];
    }
    public function getResponseSummaryDataForChart_()
    {
        $responses = $this->responses;

        if ($responses->isEmpty()) {
            return [];
        }

        $use_chart = '';
        $data = [];

        switch ($this->template) {
            case 'drop-down':
            case 'multiple-choices':
            case 'checkboxes':
                $use_chart = ($this->template == 'checkboxes') ? 'h_bar_chart' : 'pie_chart';

                $data[] = ($this->template == 'drop-down')
                    ? ['Option', 'No. of option selected']
                    : ['Choice', 'No. of choice selected'];
                $a=0;
                $saved = $responses->map->only(['answer','rating'])->all();
                foreach ($this->options as  $key => $option) {
                    if ($this->template == 'checkboxes') {
                        $option_selected_count = $responses->filter(function ($v, $k) use ($option) {
                            $value = (array) json_decode($v->answer);
                            return in_array($option, $value);
                        })->count();
                        // $option_selected_count = $responses->filter(function ($v, $k) use ($option) {
                        //     // if(!empty($v->rating)) $value = (array) json_decode($v->rating);
                        //     // else $value = [];
                        //     $rate = (array) json_decode($v->rating);
                        //     $value = (array) json_decode($v->answer);
                        //     // echo'<pre>';
                        //     // print_r($k);
                        //     // echo'</pre>';
                        //     return $k;
                        //     //return in_array($option, $value);
                        // });
                        $omy = $responses->map(function ($v, $k) {
                            return $v->rating;
                        });
                        echo'<pre>';
                        print_r($omy);
                        echo'</pre>';
                        // foreach($option_selected_count as $key => $val){
                        //      if($val==1) {$rating[$key] = $responses->pluck('rating')[0][$a]; $a++; }
                        //      else $rating[$key]=null;
                        // }
                        // var_dump($option_selected_count);
                    } else {
                        $option_selected_count = $responses->where('answer', $option)->count();
                    }

                    // array_push($data, [$option, $rating]);
                    array_push($data, [$option, $option_selected_count]);

                }
                break;

            case 'linear-scale':
                $use_chart = 'v_bar_chart';
                $min = $this->options['min'];
                $max = $this->options['max'];

                $data[] = ['Scale value', 'Count'];

                foreach (range((int) $min['value'], (int) $max['value']) as $value) {
                    $value_selected_counts = $responses->where('answer', $value)->count();

                    array_push($data, [$value, $value_selected_counts]);
                }

                break;
        }

        return [
            'chart' => $use_chart,
            'name' => str_replace('.', '_', $this->attribute),
            'data' => $data
        ];
    }
}
