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

  $(".btn-search").click(function() {
    var category_id = $("#category").val();
    if (category_id == "")
    {
      alert(I18n.t("categories.create.style_invalid"));
    }
    else
    {
      $.ajax({
        url: "/search_categories",
        type: "POST",
        data: {id: category_id},
        success: function(result) {
          $(".ajax-documents").html(result);
        },
        error: function (result) {
          alert(I18n.t("categories.create.error"));
        }
      });
    }
  });
});
