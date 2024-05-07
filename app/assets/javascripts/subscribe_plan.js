var ready;
ready = function () {
  var plan_id;
  $("#subscribe_plan_form").on("submit", function (event) {
    event.preventDefault();
    plan_id = $('input[name="subscription[plan_id]"]:checked').val();
    $("#exampleModal").modal("show");
    $("#card-form").on("submit", function () {
      $("#plan_idd").val(plan_id);
    });
  });
  $("#close-modal").on("click", function () {
    location.reload();
  });
};

$(document).ready(ready);
$(document).on("turbolinks:load", ready);
