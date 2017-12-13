$(document).ready(function () {
  $("#select").on("change", function() {
    $("#cost-per-coin").text(this.value)
  });

  $(".btn-buy-coin").click(function() {
    var dataform = {
      coin: $("#input-coin").val(),
      cost_at_buy: $("#cost-per-coin").text()
    }
    if(dataform.coin < 0)
    {
      alert(I18n.t("transaction.error_coin"));
    }
    else if (dataform.cost_at_buy == "")
    {
      alert(I18n.t("transaction.choose_error"));
    }
    else
    {
      $.ajax("/transactions",
      {
        type: "POST",
        data: dataform,
        success: function(result) {
          $(".close").click();
          $("#user-info").html(result);
        },
        error: function (result) {
          $(".close").click();
          alert(I18n.t("transaction.buy_error"));
        }
      });
    }
  });

  $(".btn-confirm").click(function() {
    var transaction_id = $(this).attr("data-id");
    if (transaction_id == "")
    {
      alert(I18n.t("categories.create.style_invalid"));
    }
    else
    {
      $.ajax({
        url: "/admin/transactions/"+transaction_id,
        type: "PATCH",
        data: {id: transaction_id},
        success: function(result) {
          if (result.success === true && result != null)
          {
            $("#transaction-" + transaction_id).remove();
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

  $(".btn-ignore").click(function() {
    var transaction_id = $(this).attr("data-id");
    if (transaction_id == "")
    {
      alert(I18n.t("categories.create.style_invalid"));
    }
    else
    {
      $.ajax({
        url: "/admin/transactions/"+transaction_id,
        type: "DELETE",
        data: {id: transaction_id},
        success: function(result) {
          if (result.success === true && result != null)
          {
            $("#transaction-" + transaction_id).remove();
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
});
