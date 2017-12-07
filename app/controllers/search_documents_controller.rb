class SearchDocumentsController < ApplicationController
  def search_name
    @documents = Document.search_name(params[:document][:name_document])
      .paginate page: params[:page]
    @categories = Category.all
  end

  def search_category
    @documents = Document.search_category(params[:id]).paginate page: params[:page]
    render partial: "search_category"
  end

end
