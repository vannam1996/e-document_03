module Admin
  class TransactionsController < ApplicationController
    before_action :check_admin_json, only: :update
    before_action :check_admin, only: :index

    def index
      @transactions = Transaction.order_by_created_at.status_confirm false
    end

    def update
      @transaction = Transaction.find_by id: params[:id]
      @user = @transaction.user
      if @transaction && @transaction.update_attributes(is_confirm: true) && @user
        update_coin
        UserMailer.added_coin(@user, @transaction).deliver_now
        render json: {success: true, response_text: t(".success")}
      else
        render json: {success: false, response_text: t(".fail")}
      end
    end

    private

    def update_coin
      user = current_user
      user.update_attribute :coin, user.coin.to_i + @transaction.coin.to_i
    end

    def check_admin_json
      return if current_user.is_admin?
      render json: {success: false, response_text: t(".not_admin")}
    end

    def check_admin
      return if current_user.is_admin?
      flash[:danger] = t ".not_admin"
      redirect_to root_url
    end
  end
end
