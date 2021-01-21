<?php

if (!function_exists('str_convert_line_breaks')) {
    function str_convert_line_breaks($string = '', $as_html = true) {
        if (empty($string)) {
            return $string;
        }

        $replace_string = ($as_html) ? "<br>" : PHP_EOL;
        $formatted_string = preg_replace("/\r\n|\r|\n/", $replace_string, $string);
        return ($as_html) ? clean($formatted_string) : $formatted_string;
    }
}

if (!function_exists('get_form_templates')) {
    function get_form_templates($alias = null, $keys = null)
    {

        $templates = collect();

        if ($alias) {
            $templates = $templates->where('alias', $alias);
        }

        if (!$templates->count(trans('forms'))) {
            return null;
        }

        if ($keys) {
            $flattened = $templates->mapWithKeys(function ($item) use ($keys) {
                $keys = (array)$keys;
                $values = [];
                foreach ($keys as $key) {
                    if (isset($item[$key])) {
                        $values[$key] = $item[$key];
                    }
                }
                return [$item['alias'] => $values];
            });

            return ($alias) ? $flattened->first() : $flattened->all();
        }
        echo'<pre>';
        print_r($templates);
        echo'</pre>';
        return ($alias) ? $templates->first() : $templates;
    }
}
