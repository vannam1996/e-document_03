class UsersController < ApplicationController
  before_action :find_user, except: %i(new create index)
  before_action :logged_in_user, only: %i(edit update show)
  before_action :correct_user, only: %i(edit update)

  def edit; end

  def new
    @user = User.new
  end

  def show
    @documents = @user.documents.order_by_created_at.paginate page: params[:page]
    @coin_values = CoinValue.all
  end

  def create
    @user = User.new params_user
    if @user.is_admin? && current_user.is_admin?
      save_admin
    else
      @user.is_admin = false
      save_user
    end
  end

  def update
    if current_user.is_admin? && (!current_user? @user)
      update_admin @user
    else
      update_user @user
    end
  end

  def index
    @users = User.status_admin(false).order_by_created_at.paginate page: params[:page]
  end

  private

  def save_admin
    if @user.save
      flash[:success] = t "users.new.create_success"
      redirect_to root_url
    else
      render :new
    end
  end

  def save_user
    if @user.save
      flash[:success] = t "users.new.create_success"
      log_in @user
      redirect_to @user
    else
      render :new
    end
  end

  def params_user
    params.require(:user).permit :name, :email, :password, :password_confirmation, :avatar, :is_admin
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "users.show.error_message"
    redirect_to root_path
  end

  def correct_user
    return if current_user.is_admin?
    @user = User.find_by id: params[:id]
    return if current_user? @user
    flash[:danger] = t "users.flash.not_correct_user"
    redirect_to root_path
  end

  def update_admin user
    if user.update_attribute :is_admin, true
      flash[:success] = t "users.update.admin_success"
    else
      flash[:danger] = t "users.update.admin_fail"
    end
    redirect_to request.referer || root_url
  end

  def update_user user
    if user.update_attributes params_user
      flash[:success] = t "users.update.success"
      redirect_to @user
    else
      render :edit
    end
  end
end
