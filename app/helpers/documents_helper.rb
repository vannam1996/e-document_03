module DocumentsHelper
  def document_illegal? document
    document.comments.status_report(true).size >= Settings.documents.illegal
  end
end
