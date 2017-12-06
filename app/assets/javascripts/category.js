$(document).ready(function () {
  $(".btn-add-category").click(function() {
    var dataform = {
      style: $(".style").val()
    }
    if(dataform.style == "")
    {
      alert(I18n.t("categories.create.style_invalid"));
    }
    else
    {
      $.ajax("/categories",
      {
        type: "POST",
        data: dataform,
        success: function(result) {
          $(".close").click();
          $(".select_category").html(result);
        },
        error: function (result) {
        $(".close").click();
          alert(I18n.t("categories.create.error"));
        }
      });
    }
  });
})
