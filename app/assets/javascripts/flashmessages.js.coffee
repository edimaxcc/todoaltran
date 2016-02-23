$ ->
  flashCallback = undefined

  flashCallback = ->
    $('.alert').fadeOut()

  $('.alert').bind 'click', ((_this) ->
    (ev) ->
      $('.alert').fadeOut()
  )(this)
  setTimeout flashCallback, 3000

