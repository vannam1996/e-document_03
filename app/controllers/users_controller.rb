class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "users.flash.errorshow"
    redirect_to signup_path
  end

  def create
    @user = User.new params_user
    if @user.save
      flash[:success] = t "users.new.create_success"
      redirect_to @user
    else
      render :new
    end
  end

  private

  def params_user
    params.require(:user).permit :name, :email, :password, :password_confirmation, :avatar
  end
end
