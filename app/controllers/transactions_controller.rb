class TransactionsController < ApplicationController
  def create
    @user = current_user
    @transaction = current_user.transactions.new params_transaction
    unless @user && @transaction && @transaction.save
      @transaction.errors.add :save, t("transaction.save_fail")
    end
    UserMailer.buy_coin(@user, @transaction).deliver_now
    render partial: "shared/user_info"
  end

  private

  def params_transaction
    params.permit :coin, :cost_at_buy
  end
end
