<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Iatstuti\Database\Support\CascadeSoftDeletes;

class FormResval extends Model
{
    use SoftDeletes, CascadeSoftDeletes;

    protected $fillable = [
        'sel_type', 'field_limit', 'custom_text'
    ];
    protected $dates = ['deleted_at'];

    protected $cascadeDeletes = ['fields', 'responses'];

    public function formField()
    {
        return $this->belongsTo(FormField::class);
    }
}
