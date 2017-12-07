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
});
