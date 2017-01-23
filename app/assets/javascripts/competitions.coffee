# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

  #выбор картинок через селект
  change_trigger = (handler) ->
    $.get
      url: "/competitions/#{$('select').val()}"
      success: (data) ->
        #console.log(data)
        box = $ '.carousel-inner'
        box.empty()
        data.forEach (i) ->
          box.append "<div  class='item'><img id=#{i.id} class='center'   +
            src=#{i.file.url}><div class='carousel-caption'>Средняя оценка фото: #{i.ave_value}</div></div>"

        $($('.item')[0]).addClass('active');

  $('select').change change_trigger
  change_trigger $('select')

#  $(window).load info
#  info = ->
#    id = $('.active > img').attr('id')
  #id в оценку
  info = ->
    $.get
      url: "/info/#{$('.active > img').attr('id')}"
      success: (data) ->
        console.log(data)
        box = $ '.value-form'
        box.empty()
        box.append "<div  class='qwert'>#{data.id}</div>"


  $('#myCarousel').click info
  $('select').change info





