desc "static end month"
task send_static_end_month: :environment do
  users = User.status_admin true
  transactions = Transaction.in_period Time.zone.now.beginning_of_month,
    Time.zone.now.end_of_month
  total = 0
  transactions.each do |t|
    total += t.coin * t.cost_at_buy
  end
  UserMailer.static_end_month(users,transactions,total).deliver!
end
