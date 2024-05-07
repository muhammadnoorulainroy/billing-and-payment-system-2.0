var ready
ready = (function(){
  $(':checkbox').on('change', function () {
    $('input[type="submit"]').prop('disabled', !$(':checkbox:checked').length);
  }).change();

  $(':radio').on('change', function () {
    $('input[type="submit"]').prop('disabled', !$(':radio:checked').length);
  }).change();
})

$(document).ready(ready);
$(document).on('turbolinks:load', ready)

