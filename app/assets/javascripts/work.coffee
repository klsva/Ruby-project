# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  change_trigger = (handler) ->
    $.get
      url: "/work/#{$('select').val()}"
      success: (data) ->
        box = $ '.carousel-inner'
        box.empty()
        data.forEach (file) ->
          box.append "<div class=item><img height=350 src=/assets/pictures/#{file}></div>"
        $($('.item')[0]).addClass('active');
  $('select').change change_trigger
  change_trigger $('select')