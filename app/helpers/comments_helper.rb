module CommentsHelper
  def load_data_comment
    @comments = @document.comments.main_comment.order_by_created_at.paginate page: params[:page],
      per_page: Settings.comments.per_page
    @all_replies = Comment.all_comment_replies.order_by_created_at.group_by(&:reply_id)
  end
end
