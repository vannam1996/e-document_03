class DocumentsController < ApplicationController
  before_action :logged_in_user, only: :destroy
  before_action :correct_document, only: :destroy

  def destroy
    if @document.destroy
      flash[:success] = t "documents.destroy.success"
    else
      flash[:danger] = t "documents.destroy.fail"
    end
    redirect_to request.referer || root_url
  end

  private

  def params_document
    params.require(:document).permit :name_document, :content, :user_id
  end

  def correct_document
    @document = current_user.documents.find_by id: params[:id]
    redirect_to root_url if @document.nil?
  end
end
