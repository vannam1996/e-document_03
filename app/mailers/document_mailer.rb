class DocumentMailer < ApplicationMailer
  def upload_success user
    @user = user
    mail to: @user.email, subject: t(".title")
  end
end
