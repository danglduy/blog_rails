User.create!(name:  "123",
             email: "123@123.com",
             password:              "123123",
             password_confirmation: "123123",
             admin: true,
            )

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
            )
end

users = User.order(:created_at).take(6)
50.times do
    title = Faker::Lorem.sentence(1)
    content = [ Faker::Markdown.emphasis,
                Faker::Markdown.ordered_list,
                Faker::Markdown.inline_code,
                Faker::Markdown.block_code,
                Faker::Markdown.table ].join("\n")
    users.each { |user| user.posts.create!(title: title, content: content)  }
end
users = User.order(:created_at).take(6)
posts = Post.where(user_id: 1)
50.times do
  content = Faker::Lorem.sentence(2)
  users.each do |user|
    posts.each do |post|
      post.comments.create!(content: content, user_id: user.id)
    end
  end
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed)  }
followers.each { |follower| follower.follow(user)  }

