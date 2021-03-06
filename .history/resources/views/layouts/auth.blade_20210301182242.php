<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>@yield('title') - {{ config('app.name') }}</title>

    <link href="{{ asset('favicon.ico') }}" rel="icon">

    <!-- Global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet">
    <link href="{{ asset('assets/css/icons/icomoon/styles.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/css/bootstrap.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/css/core.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/css/components.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/css/colors.min.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/css/custom.css') }}" rel="stylesheet">

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    {{-- <link href="{{ asset('assets/css/font-awesome.min.css') }}" rel="stylesheet"> --}}
    {{--  <link href="{{ asset('assets/css/themes/css-stars.css') }}" rel="stylesheet">  --}}
    {{--  <link href="{{ asset('assets/css/themes/bootstrap-stars.css') }}" rel="stylesheet">  --}}
    {{--  <link href="{{ asset('assets/css/themes/fontawesome-stars-o.css') }}" rel="stylesheet">  --}}
    <link href="{{ asset('assets/css/starrating.css') }}" rel="stylesheet">
    @yield('plugin-css')
    <!-- /global stylesheets -->
</head>

@php
    $page_container = $classes['page_container'] ?? '';
    $should_remove_footer = $remove_footer ?? false;
@endphp

<body class="login-container">

    <div class="{{ !empty($page_container) ? $page_container : 'page-container' }}">

        <div class="page-content mt-5">

            <div class="content-wrapper">

                <div class="content pb-20">

                    @yield('content')

                    <!-- Footer -->
                    @if (!$should_remove_footer)
                        @include('partials.footer')
                    @endif
                    <!-- /footer -->
                </div>

            </div>

        </div>

    </div>

    @yield('modalBox')
    @yield('walidator')

    <!-- Core JS files -->
    <script src="{{ asset('assets/js/plugins/pace.min.js') }}"></script>
    <script src="{{ asset('assets/js/core/libraries/jquery.min.js') }}"></script>
     <script src="{{ asset('assets/js/core/libraries/jquery-ui.min.js') }}"></script>
     <script src="{{ asset('assets/js/core/libraries/jquery.ui.sortable-animation.js') }}"></script>
    <script src="{{ asset('assets/js/core/libraries/bootstrap.min.js') }}"></script>
    {{--  <script src="{{ asset('assets/js/plugins/blockui.min.js') }}"></script>  --}}
    <!-- /core JS files -->

    <!-- Theme JS files -->
    @yield('plugin-scripts')
    <script src="{{ asset('assets/js/core/app.js') }}"></script>
    <script src="{{ asset('assets/js/plugins/ripple.min.js') }}"></script>
    <!-- /theme JS files -->

    <script src="{{ asset('assets/js/custom/main.js') }}"></script>
    @yield('page-script')
</body>
</html>
