class UserMailer < ApplicationMailer
  def user_not_login users
    @users = users
    mail to: users.map(&:email).uniq, subject: t("user_mailer.mail_user.title")
  end
end
