class UserMailer < ApplicationMailer
  def user_not_login users
    @users = users
    mail to: users.map(&:email).uniq, subject: t("user_mailer.mail_user.title")
  end

  def buy_coin user, transaction
    @user = user
    @transaction = transaction
    mail to: user.email, subject: t("user_mailer.buy_coin.subject")
  end

  def static_end_month users, transactions, total
    @users = users
    @transactions = transactions
    @total = total
    mail to: users.map(&:email).uniq,
      subject: t("user_mailer.static_end_month.subject")
  end

  def added_coin user, transaction
    @user = user
    @transaction = transaction
    mail to: user.email, subject: t("user_mailer.added_coin.subject")
  end

  def ignore_transaction user, transaction
    @user = user
    @transaction = transaction
    mail to: user.email, subject: t("user_mailer.ignore_transaction.subject")
  end
end
