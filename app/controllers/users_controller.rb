class UsersController < ApplicationController
  before_action :find_user, except: %i(new create)
  before_action :logged_in_user, only: %i(edit update show)

  def edit; end

  def new
    @user = User.new
  end

  def show
    return if @user
    flash[:danger] = t "users.flash.errorshow"
    redirect_to signup_path
  end

  def create
    @user = User.new params_user
    if @user.save
      flash[:success] = t "users.new.create_success"
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def update
    if @user.update_attributes params_user
      flash[:success] = t "users.update.success"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def params_user
    params.require(:user).permit :name, :email, :password, :password_confirmation, :avatar
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "users.show.error_message"
    redirect_to root_path
  end
end
