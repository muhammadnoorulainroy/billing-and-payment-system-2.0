ready = ->
  $("input").keypress ->
   $('.alert-danger').hide()

$(document).ready ready
$(document).on 'turbolinks:load', ready
