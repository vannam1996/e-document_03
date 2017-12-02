# Preview all emails at http://localhost:3000/rails/mailers/uploaded_document_mailer
class UploadedDocumentMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    UploadedDocumentMailer.send_email(User.first)
  end
end
