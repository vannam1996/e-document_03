users = User.order(:created_at).take(6)
50.times do |n|
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
20.times do |n|
  name_document = Faker::Book.title
  users.each { |user| user.documents.create!(name_document: name_document,
    category_id: 1,
    content: "#{name_document}as")}
end
