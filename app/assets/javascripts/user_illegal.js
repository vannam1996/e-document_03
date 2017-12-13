$(document).ready(function () {
  $(".btn-ban-user").click(function() {
    var user_id = $(this).attr("data-id");
    if (user_id == "")
    {
      alert(I18n.t("admin.users.fail"));
    }
    else
    {
      $.ajax({
        url: "/admin/users/"+user_id,
        type: "DELETE",
        data: {id: user_id},
        success: function(result) {
          if (result.success === true && result != null)
          {
            $("#user-" + user_id).remove();
            $(".success").text(result.response_text);
            $(".fail").text("");
          }
          else
          {
            $(".success").text("");
            $(".fail").text(result.response_text);
          }
        },
        error: function (result) {
          alert(I18n.t("admin.users.fail"));
        }
      });
    }
  });
});
