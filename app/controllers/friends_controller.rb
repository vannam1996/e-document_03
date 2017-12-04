class FriendsController < ApplicationController
  before_action :logged_in_user, only: %i(index destroy)

  def index
    @user = User.find_by(id: params[:user_id])
    return unless @user
    @title = t "users.friended.title"
    array_id = Friend.friend_list_id params[:user_id]
    @friends = User.friend_of_user(array_id).paginate page: params[:page]
  end

  def destroy
    destroy_friend params[:id], params[:user_id]
    redirect_to request.referer || root_url
  end

  private

  def destroy_friend sender_id, accepter_id
    friend = Friend.find_by sender_id: [sender_id, accepter_id], accepter_id: [sender_id, accepter_id]
    if friend && friend.destroy
      flash[:success] = t "friends.destroy.success"
    else
      flash[:danger] = t "friends.destroy.fail"
    end
  end
end
