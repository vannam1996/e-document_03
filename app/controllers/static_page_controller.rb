class StaticPageController < ApplicationController
  def home
    return unless is_loged_in?
    @user = current_user
    @documents = Document.order_by_created_at.paginate page: params[:page]
  end
end
