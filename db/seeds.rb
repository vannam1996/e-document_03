User.create!(name:  "Admin",
             email: "admin@gmail.com",
             password: "123456",
             password_confirmation: "123456",
             up_count: 0,
             down_count: 0,
             coin: 100,
             is_admin: true)

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               up_count: 0,
               down_count: 0,
               coin: 20,
               password_confirmation: password)
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

users = User.order(:created_at).take(6)
10.times do |n|
  name_document = Faker::Book.title
  users.each { |user| user.documents.create!(name_document: name_document,
    category_id: 1,
    content: "#{name_document}.pdf")}
end

users = User.order(:created_at).take(6)
10.times do |n|
  name_document = Faker::Book.title
  users.each { |user| user.documents.create!(name_document: name_document,
    category_id: 2,
    content: "#{name_document}.pdf")}
end

10.times do |n|
  cost = n*100
  type = Faker::Bank.name
  CoinValue.create!(cost_per_coin: cost,
    type_buy: type)
end
