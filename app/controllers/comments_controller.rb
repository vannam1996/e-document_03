class CommentsController < ApplicationController
  before_action :find_comment, only: :destroy
  before_action :find_document, only: :create

  def create
    @comment = current_user.comments.new params_comment
    if @comment.save
      load_data_comment
      reponse_action
    else
      flash[:danger] = t "comments.comment.comment_error"
      redirect_to request.referer || root_url
    end
  end

  def destroy
    if @comment && @comment.destroy
      destroy_reply_comment
      flash[:success] = t "comments.comment.del_success"
    else
      flash[:danger] = t "comments.comment.del_error"
    end
    redirect_to request.referer || root_url
  end

  private

  def params_comment
    params.require(:comment).permit :content, :document_id, :reply_id
  end

  def find_comment
    @comment = Comment.find_by id: params[:id]
    return if @comment
    flash[:danger] = t "comments.comment.find_error"
    redirect_to root_url
  end

  def reponse_action
    respond_to do |format|
      format.html{redirect_to document_path params[:document_id]}
      format.js
    end
  end

  def destroy_reply_comment
    reply_comment = Comment.comment_replies @comment.id
    if reply_comment && reply_comment.destroy_all
      flash[:success] = t "comments.comment.del_success"
    else
      flash[:danger] = t "comments.comment.del_error"
    end
  end

  def find_document
    @document = Document.find_by id: params[:document_id]
    return if @document
    flash[:danger] = t "documents.error_find"
    redirect_to root_url
  end
end
