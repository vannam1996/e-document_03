class TransactionsController < ApplicationController
  def create
    @transaction = current_user.transactions.new params_transaction
    unless @user && @transaction && @transaction.save
      @transaction.errors.add :save, t("transaction.save_fail")
    end
    update_coin
    render partial: "shared/user_info"
  end

  private

  def params_transaction
    params.permit :coin, :cost_at_buy
  end

  def update_coin
    @user = current_user
    @user.update_attribute :coin, @user.coin.to_i + @transaction.coin.to_i
  end
end
