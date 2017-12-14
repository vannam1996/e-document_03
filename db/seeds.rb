User.create!(name:  "Admin",
             email: "admin1@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             is_admin: true,
             up_count: 0,
             down_count: 0,
             coin: 2000)

50.times do |n|
  name  = Faker::Name.name
  email = "user-#{n}@gmail.com"
  password = "123456"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               up_count: 0,
               down_count: 0,
               coin: 30)
end

users = User.order(:created_at).take(6)
20.times do |n|
  users.each { |user| Friend.create!(
    is_accept: true,
    sender_id: user.id,
    accepter_id: n+7)}
end

users = User.first
20.times do
  style = Faker::Book.genre
   users.categories.create!(style: style)
end

CoinValue.create!(cost_per_coin: 1000, type_buy: "ATM")
CoinValue.create!(cost_per_coin: 2000, type_buy: "Paypal")
