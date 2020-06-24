# frozen_string_literal: true

user = User.new(
  name: '123',
  email: '123@123.com',
  password: '123123',
  password_confirmation: '123123',
  admin: true
)
user.skip_confirmation!
user.save!

30.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  user = User.new(
    name: name,
    email: email,
    password: password,
    password_confirmation: password
  )
  user.skip_confirmation!
  user.save!
end

users = User.order(:created_at).take(6)

10.times do
  title = Faker::Lorem.sentence(word_count: 1)
  content = [Faker::Markdown.emphasis,
             Faker::Markdown.ordered_list,
             Faker::Markdown.inline_code,
             Faker::Markdown.block_code,
             Faker::Markdown.table].join("\n\n")
  users.each { |u| u.posts.create!(title: title, content: content) }
end
users = User.order(:created_at).take(6)
posts = Post.where(user_id: 1)

10.times do
  content = Faker::Lorem.sentence(word_count: 2)
  users.each do |u|
    posts.each do |post|
      post.comments.create!(content: content, user_id: u.id)
    end
  end
end

# Following relationships
users = User.all
user  = users.first
following = users[2..15]
followers = users[3..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
