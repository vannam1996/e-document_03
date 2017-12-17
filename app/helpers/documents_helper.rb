module DocumentsHelper
  def document_illegal? document
    document.comments.status_report(true).size >= Settings.documents.illegal
  end

  def size_comments document
    document.comments.status_report(false).size
  end
end
