desc "user_not_login"
task send_user_not_login: :environment do
  users = User.not_login(3.days.ago).status_admin(false)
  UserMailer.user_not_login(users).deliver_now!
end
