$(document).ready(function () {
  $(".btn-add-report").click(function() {
    var dataform = {
      content: $(".content").val(),
      document_id: $("#document-id").val(),
      is_report: true
    }
    if(dataform.content == "" || dataform.is_report != true)
    {
      alert(I18n.t("categories.create.style_invalid"));
    }
    else
    {
      $.ajax({
        url: "/create_report",
        type: "POST",
        data: dataform,
        success: function(result) {
          $(".close").click();
          $(".report").html(result);
        },
        error: function (result) {
          $(".close").click();
          alert(I18n.t("categories.create.error"));
        }
      });
    }
  });
});
