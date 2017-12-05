class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    return if is_loged_in?
    flash[:danger] = t "users.flash.danger_login"
    redirect_to login_url
  end
end
