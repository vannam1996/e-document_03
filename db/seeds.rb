User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password: "123456",
             password_confirmation: "123456",
             is_admin: true)

50.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
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
    content: "#{name_document}as")}
end

users = User.order(:created_at).take(6)
10.times do |n|
  name_document = Faker::Book.title
  users.each { |user| user.documents.create!(name_document: name_document,
    category_id: 2,
    content: "#{name_document}as")}
end

