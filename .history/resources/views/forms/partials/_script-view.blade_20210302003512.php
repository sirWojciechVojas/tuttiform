<script>
    $(function() {

        var form = '{{ $form->code }}';
        var fields = {!! json_encode($formatted_fields) !!};
        var resvals = {!! json_encode($formatted_resvals[$ffid]) !!};
        var template_divs = $('#form-fields').children('.field');

        if (!$.isEmptyObject(fields) && template_divs.length > 0) {
            setUpFormFields(fields, template_divs);
        }

        autosize($('.elastic'));

        $('.styled').uniform({
            radioClass: 'choice'
        });

        //$('.checkboxes .options').sortable({revert: true});

        // $('.bootstrap-select').selectpicker();
        $('select.select').select2({
            minimumResultsForSearch: Infinity
        });

        $('#exampleModal').on('show.bs.modal', function(){
            $('#exampleModalLabel').text('Distribute the points');
            var tiles = $('#user-form li.tile div.checkbox div.checker > span.checked').closest('li.tile').clone();
            var ile = tiles.length;

            tiles.each(function(index){
                $(this).find('.points-rating span').text(ile-index+' pkt').before('<span class="glyphicon glyphicon-menu-hamburger"></span>').parent().css({'visibility': 'visible'});

            });

            $(this).find('.modal-body #sortable').html(tiles.removeClass('col-md-6 col-lg-4'));

            $('.modal-body #sortable').sortable({
                items:'> .tile',
                placeholder: "ui-sortable-placeholder",
                //appendTo: 'body',
                forcePlaceholderSize: true,
                helper: 'clone',
                cursor: "move",
                animation: 150,
                revert: 250,
                //distance: 5,
                //grid: [ 10, 50 ],
                axis: "y",
                //handle: ".handle"
                stop: function( event, ui ) {
                    $(this).find('.points-rating span:not(".glyphicon")').each(function(index){
                        $(this).text(ile-index+' pkt');
                        //alert(ile-index);
                    });
                }
            }).disableSelection();
        });
        $('.pickadate').each(function (index) {
            var $pickadate = $(this);

            $pickadate.pickadate({
                format: 'd mmmm, yyyy',
                formatSubmit: 'yyyy-mm-dd',
                hiddenName: true,
                selectMonths: true,
                today: '',
                selectYears: 90,
                editable: true,
                onClose: function() {
                    $('.datepicker').focus();
                }
            });

            var picker_date = $pickadate.pickadate('picker');
            $pickadate.on('click', function(event) {
                if (picker_date.get('open')) {
                    picker_date.close();
                } else {
                    picker_date.open();
                }
                event.stopPropagation();
            });
        });

        $('#user-form').validate({
            submitHandler: function (form) {
                nextStep(form, function(){
                    var $panel = $(form).closest('.panel-body');
                    var response = 'Co jest grane drogi panie?';
                    var paragraph = $('p').addClass('content-group').text(response);

                    $panel.empty();
                    $panel.append(paragraph);
                });
                //saveResponse(form, function () {

                    //var $panel = $(form).closest('.panel-body');
                    //var response = 'Your responses have been submitted successfully.';
                    //var paragraph = $('p').addClass('content-group').text(response);

                    //$panel.empty();
                    //$panel.append(paragraph);
                //}, function (error_message) {
                    //notify('error', 'Error occured: ' + error_message);
                //});
                return false;
            }
        });

        $('.pickatime').each(function (index) {
            var $pickatime = $(this);

            $pickatime.pickatime({
                editable: true,
                formatSubmit: 'HH:i',
                hiddenName: true
            });

            var picker_time = $pickatime.pickatime('picker');
            $pickatime.on('click', function(event) {
                if (picker_time.get('open')) {
                    picker_time.close();
                } else {
                    picker_time.open();
                }
                event.stopPropagation();
            });
        });

        function setUpFormFields(fields, template_divs) {
            template_divs.each(function (index) {
                var field_id = $(this).data('id');
                var field_attribute = $(this).data('attribute');
                var field_attribute_type = $(this).data('attributeType');

                var field_data = fields[field_attribute];
                var template = $(this).find('.template');

                var label = template.find('label.field-label');
                var id = field_attribute + '.' + field_id;

                label.attr('for', id);
                label.find('span.question').text(field_data['question']);

                if (field_data['required']) {
                    label.append(' <span class="text-danger required">*</span>');
                }

                if (field_attribute_type === 'single') {
                    var template_input = template.find('input');
                    var input = (template_input.length) ? template_input : template.find('textarea');

                    input.attr({
                        id: id,
                        name: field_attribute
                    });

                    if (field_data['required']) {
                        input.prop('required', true);
                        input.attr('required', 'required');
                    }
                } else {
                    var options_div = template.find('.options');
                    if (options_div.hasClass('button')) {
                        var type = options_div.hasClass('checkboxes') ? 'checkbox' : 'radio';
                        var sample_button = options_div.find('div.' + type).parent().clone();
                        var sample_rating = options_div.find('div.points-rating').clone();
                        options_div.find('div.points-rating').empty();
                        options_div.empty();

                        /*
                        var all_options='<option value="" class="option"></option>';
                        for(v=1;v<=10;v++){
                            all_options+='<option value="'+v+'" class="option">'+v+'</option>';
                        }
                        */

                        if (field_data['options'] !== null) {
                            var field_options = field_data['options'];
                            var nr = 0;
                            for (var i = 0; i < field_options.length; i++) {
                                var button = sample_button.clone();
                                //var star = sample_star.clone();

                                var button_field_name = 'input[type='+ type +']';

                                var input = button.find(button_field_name);
                                //var selekt= star.find('select.rating');
                                var name = (type === 'checkbox') ? field_attribute + '[]' : field_attribute;

                                input.attr({
                                    name: name,
                                    value: field_options[i]
                                });


                                if (i === 0 && field_data['required']) {
                                    input.prop('required', true);
                                    input.attr('required', 'required');
                                }
                                nr = i+1;

                                button.find('span.option').text(field_options[i])
                                                          .attr({'title' : field_options[i],
                                                                 'data-toggle' : 'tooltip'
                                                                });
                                //star.find('select.rating').attr('id','id-'+i).attr('data-id','id-'+i).html(all_options);

                                options_div.append(button);

                                //options_div.find('.tile .post').replaceWith(star);
                            }
                        }
                        //$('[data-toggle="tooltip"]').tooltip({ boundary: 'window' });
                        //$('.rating').barrating({
                        //    theme: 'fontawesome-stars-o',
                         //   onSelect:function(value, text, event){
                                //$(this).val(0);
                                //alert(value);
                        //        return false;
                        //    }
                        //});

                        $('.br-theme-fontawesome-stars-o .br-widget').addClass('flexBox');
                        $('.checkbox input[type="checkbox"]').on('change', function(event){
                            var act_span = $('.walid span');
                            var actual = parseInt(act_span.first().text());

                            var remain = parseInt($('.walid span:eq(1) input').val());
                            var limit = parseInt(act_span.last().text());
                            //var selekt =  $(this).closest('.checkbox').next().find('.post-action select.rating');

                            if($(event.currentTarget).is(':checked')) {
                                a=1;
                                b=-1;
                                //$(this).closest('.checkbox').next().css('visibility','visible');
                                //selekt.attr({
                                    //name: selekt.attr('name')+'.'+name
                               // });
                            }
                            else {
                                a=-1;
                                b=1;
                                //$(this).closest('.checkbox').next().css('visibility','hidden');
                                //selekt.attr({
                                    //name: 'rating'
                                //});
                            }
                            if(Math.abs(remain+b)==1) var song = ' utwór';
                            else if(Math.abs(remain+b)>1 && Math.abs(remain+b)<5) var song = ' utwory';
                            else if(Math.abs(remain+b)>10 && Math.abs(remain+b)<21) var song = ' utworów';
                            else if(Math.abs(remain+b)>21){
                                if(Math.abs(remain+b)%10<5) var song = ' utwory';
                                else var song = ' utworów';
                            }
                            else var song = ' utworów';
                            if(remain+b!==0){
                                if(resvals.sel_type==0) var brav=' więcej o ';
                                else if(resvals.sel_type==1) var brav=' do limitu ';
                                else if(resvals.sel_type==2) var brav=' ';
                            }
                            else var brav=' ';
                            act_span.first().text(actual+a);
                            $('.walid span:eq(1) input').val(remain+b);
                            var remainInput = $('.walid span:eq(1) input').clone();
                            $('.walid span:eq(1)').text(Math.abs(remain+b)).append(remainInput);
                            var remainNum = $('.walid span:eq(1)').clone();
                            //console.log(actual +'|'+ limit);
                            if(actual+a !== limit && resvals.sel_type==2) {
                                $('.walid').addClass('flash');
                                $('#submit').addClass('disabled').attr('disabled',true);
                                if(actual+a < limit) $('.walid span:eq(1)').parent().text('Pozostało: ').append(remainNum).append(song);
                                else if(actual+a > limit) $('.walid span:eq(1)').parent().text('Przekroczono o: ').append(remainNum).append(song);
                                //$('.walid div:eq(2)').show();
                                //$('.walid div:eq(3)').hide();
                            }
                            else if(actual+a > limit && resvals.sel_type==1) {
                                $('.walid').addClass('flash');
                                $('#submit').addClass('disabled').attr('disabled',true);
                                if(actual+a < limit) $('.walid span:eq(1)').parent().text('Pozostało: ').append(remainNum).append(song);
                                else if(actual+a > limit) $('.walid span:eq(1)').parent().text('Przekroczono o: ').append(remainNum).append(song);
                                //$('.walid div:eq(2)').show();
                                //$('.walid div:eq(3)').hide();
                            }
                            else if(actual+a < limit && resvals.sel_type==0) {
                                $('.walid').addClass('flash');
                                $('#submit').addClass('disabled').attr('disabled',true);
                                if(actual+a < limit) $('.walid span:eq(1)').parent().text('Pozostało: ').append(remainNum).append(song);
                                else if(actual+a > limit) $('.walid span:eq(1)').parent().text('Przekroczono o: ').append(remainNum).append(song);
                                //$('.walid div:eq(2)').show();
                                //$('.walid div:eq(3)').hide();
                            }
                            else {
                                $('.walid').removeClass('flash');
                                $('#submit').removeClass('disabled').attr('disabled',false);
                                $('.walid span:eq(1)').parent().text('Brawo'+brav).append(remainNum).append(song);
                               // $('.walid div:eq(2)').hide();
                               // $('.walid div:eq(3)').show();
                            }
                        });
                    } else if (options_div.hasClass('select')) {
                        var select = options_div.find('select.select');
                        select.attr({
                            id: id,
                            name: field_attribute
                        });

                        if (field_data['required']) {
                            select.prop('required', true);
                            select.attr('required', 'required');
                        }

                        if (field_data['options'] !== null) {
                            var field_options = field_data['options'];
                            var option = '<option value="">Choose an Option</option>'
                            for (var i = 0; i < field_options.length; i++) {
                                option += '<option value="' + field_options[i] + '">' + field_options[i] + '</option>';
                            }
                            select.append(option);
                        }
                    } else if (options_div.hasClass('scale')) { // Linear scale
                        var input = options_div.find('.input-group');
                        var field_options = field_data['options'];
                        var min = field_options["min"];
                        var max = field_options["max"];

                        if (min["label"] === null && max["label"] === null) {
                            input.removeClass('input-group').addClass('no-label');
                        }

                        if (min["label"] !== null) {
                            var option_span = $('<span class="input-group-addon option-label"></span>');
                            option_span.text(min["label"]);
                            input.prepend(option_span);
                        }

                        var min_value = Number(min["value"]);
                        var max_value = Number(max["value"]);
                        var input_range = $('<input type="range" class="form-control slider" name="' + field_attribute + '" id="' + id + '" min="' + min_value + '" max="' + max_value + '" step="1">');
                        if (field_data['required']) {
                            input_range.prop('required', true);
                            input_range.attr('required', 'required');
                        }
                        input.append(input_range);
                        var values = [];

                        for (var i = min_value; i <= max_value; i++) {
                            values.push(i);
                        }

                        input_range.ionRangeSlider({
                            min: min_value,
                            max: max_value,
                            // grid: true,
                            step: 1,
                            prefix: 'Rating: ',
                            keyboard: true,
                            values: values,
                        });

                        if (max["label"] !== null) {
                            var option_span = $('<span class="input-group-addon option-label"></span>');
                            option_span.text(max["label"]);
                            input.append(option_span);
                        }
                    }
                }
            });
        }

        function nextStep(form, successCallback, failedCallback) {
            var $form = $(form);
            submit_button = $form.find('#submit');
            submit_button.button('loading');

            alert($form.attr('action'));

        }
        function saveResponse(form, successCallback, failedCallback) {
            var $form = $(form);

            submit_button = $form.find('#submit');
            submit_button.button('loading');
            //alert('ppppp');

            $.ajax({
                url: $form.attr('action'),
                type: $form.attr('method'),
                data: $form.serialize(),
                dataType: 'json'
            })
            .done(function (response) {
                submit_button.button('complete');
                $('.walid').hide();

                if (response.success) {
                    successCallback();
                } else {
                    failedCallback(response.error);
                    //console.log(response.printed);
                    document.write(response.printed);
                }
            });
        }
    });

    function notify(type, message) {
        noty({
            width: 200,
            text: message,
            type: type,
            dismissQueue: true,
            timeout: 6000,
            layout: 'top',
            buttons: false
        });
    }
</script>
