class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites.order_by_created_at
      .paginate page: params[:page]
  end
end
