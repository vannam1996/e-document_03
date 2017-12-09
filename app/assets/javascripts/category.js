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

  $(".btn-remove").click(function() {
    var category_id = $(this).attr("data-id");
    if (category_id == "")
    {
      alert(I18n.t("categories.create.style_invalid"));
    }
    else
    {
      $.ajax({
        url: "/admin/categories/"+category_id,
        type: "DELETE",
        data: {id: category_id},
        success: function(result) {
          if (result.success === true && result != null)
          {
            $("#category-" + category_id).remove();
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
          alert(I18n.t("categories.create.error"));
        }
      });
    }
  });

  $(".modal-edit").click(function(){
    $("#category-id").val($(this).attr("data-id"))
  });

  $(".btn-edit").click(function() {
    var dataform = {
      id: $("#category-id").val(),
      style: $(".content").val()
    };
    if (dataform.id === "" || dataform.style === "")
    {
      alert(I18n.t("categories.create.style_invalid"));
    }
    else
    {
      $.ajax({
        url: "/admin/categories/"+dataform.id,
        type: "PATCH",
        data: dataform,
        success: function(result) {
          if (result.success === true && result != null)
          {
            $(".close").click();
            $("#style-" + dataform.id).text(dataform.style.toLowerCase());
            $(".success").text(result.response_text);
            $(".fail").text("");
          }
          else
          {
            $(".close").click();
            $(".success").text("");
            $(".fail").text(result.response_text);
          }
        },
        error: function (result) {
          alert(I18n.t("categories.create.error"));
        }
      });
    }
  });
});
