class DocumentsController < ApplicationController
  before_action :logged_in_user, only: %i(new create destroy)
  before_action :find_document, only: %i(destroy show)
  before_action :load_data_comment, only: :show

  def show
    @document = Document.find_by id: params[:id]
    @comment = current_user.comments.build
    return if @document
    flash[:danger] = t "documents.show.fail"
    redirect_to root_url
  end

  def destroy
    if current_user.is_admin? && document_illegal?(@document) || correct_document?(@document)
      delete_document @document
    else
      flash[:danger] = t "documents.destroy.fail"
    end
    redirect_to request.referer || root_url
  end

  def new
    @document = current_user.documents.build
    @category = current_user.categories.build
    @categories = Category.all
  end

  def create
    @document = current_user.documents.new params_document
    if @document.save
      flash[:success] = t "documents.upload_success"
      redirect_to request.referer || root_url
    else
      flash[:danger] = t "documents.upload_error"
      redirect_to root_path
    end
  end

  private

  def find_document
    @document = Document.find_by id: params[:id]
    return if @document
    flash[:danger] = t "documents.error_find"
    redirect_to root_url
  end

  def params_document
    params.require(:document).permit :category_id, :name_document, :content
  end

  def correct_document? document
    document == current_user.documents.find_by(id: params[:id])
  end

  def delete_document document
    if document.destroy
      flash[:success] = t "documents.destroy.success"
    else
      flash[:danger] = t "documents.destroy.fail"
    end
  end
end
