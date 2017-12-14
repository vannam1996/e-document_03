module Admin
  class UsersController < ApplicationController
    before_action :find_user, only: :destroy
    before_action :logged_in_user, only: %i(index destroy)
    before_action :is_admin?, only: %i(index destroy)

    def index
      @documents = Document.only_deleted.status_illegal(true).group_by(&:user_id)
      @users = User.user_by_ids(@documents.keys).status_admin(false)
        .paginate page: params[:page]
    end

    def destroy
      if @user && @user.destroy && !@user.is_admin?
        render json: {success: true, response_text: t("admin.users.success")}
      else
        render json: {success: false, response_text: t("admin.users.fail")}
      end
    end

    private

    def find_user
      @user = User.find_by id: params[:id]
      return if @user
      flash[:danger] = t "users.show.error_message"
      redirect_to root_path
    end

    def is_admin?
      return if current_user.is_admin?
      flash[:danger] = t "admin.users.not_admin"
      redirect_to root_url
    end
  end
end
