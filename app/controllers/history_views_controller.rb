class HistoryViewsController < ApplicationController
  before_action :logged_in_user, only: :index

  def index
    @history_views = current_user.history_views.order_by_updated_at
      .includes(:document).paginate page: params[:page]
  end
end
