module CommentsHelper
  def load_data_comment
    @comments = @document.comments.main_comment.status_report(false)
      .order_by_created_at.paginate page: params[:page],
      per_page: Settings.comments.per_page
    @all_replies = Comment.all_comment_replies.order_by_created_at.group_by(&:reply_id)
  end

  def user_report? user_id, document
    document.comments.search_user(user_id).status_report(true).present?
  end

  def owner_document? user, document
    user == document.user
  end
end
