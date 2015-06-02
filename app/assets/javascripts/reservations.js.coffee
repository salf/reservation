# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('.picker-start').datetimepicker({
    stepping: 5,
    sideBySide: true,
    showTodayButton: true,
    showClear: true,
    widgetPositioning: {horizontal: 'left'},
    format: 'DD.MM.YYYY H:mm',
    extraFormats: ['YYYY-MM-DD HH:mm']
  });
  $('.picker-end').datetimepicker({
    stepping: 5,
    sideBySide: true,
    showTodayButton: true,
    showClear: true,
    widgetPositioning: {horizontal: 'left'},
    format: 'DD.MM.YYYY H:mm',
    extraFormats: ['YYYY-MM-DD HH:mm']
  });

  $('.picker-start').on 'dp.change', (e) ->
    $('.picker-end').data('DateTimePicker').minDate e.date
    return
  $('.picker-end').on 'dp.change', (e) ->
    $('.picker-start').data('DateTimePicker').maxDate e.date
    return

$(document).ready(ready)
$(document).on('page:load', ready)

