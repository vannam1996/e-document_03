class FavoritesController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :find_favorite, only: %i(destroy)

  def index
    @favorites = current_user.favorites.order_by_created_at
      .paginate page: params[:page]
  end

  def create
    @favorite = current_user.favorites.new document_id: params[:document_id]
    if @favorite && @favorite.save
      flash[:success] = t "favorite.add_success"
    else
      flash[:danger] = t "favorite.add_error"
    end
    redirect_to request.referer || root_url
  end

  def destroy
    if @favorite && @favorite.destroy
      flash[:success] = t "favorite.un_success"
    else
      flash[:danger] = t "favorite.un_error"
    end
    redirect_to request.referer || root_url
  end

  private

  def find_favorite
    @favorite = Favorite.find_by id: params[:id]
    return if @favorite
    flash[:danger] = t "favorite.error_find"
    redirect_to root_path
  end
end
