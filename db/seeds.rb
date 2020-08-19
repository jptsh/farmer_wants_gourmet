require 'faker'

Box.destroy_all
User.destroy_all

10.times do
  user = User.new(
    email: Faker::Internet.email, 
    password: Faker::Internet.password)
  user.save
end

User.create(email: "mail.jp@protonmail.com", password: 123456)

10.times do
  box = Box.new(
    content: Faker::Hipster.paragraph, 
    price: Faker::Number.decimal(l_digits: 2), 
    user_id:rand(User.first.id..User.last.id)
  )
  box.save
end

Box.create(name: "Carrot Box", weight: 1, size: "small", price: 4, content: "greate and fresh", user_id: rand(User.first.id..User.last.id))
Box.create(name: "Apple Box", weight: 3, size: "medium", price: 6, content: "boskop fresh", user_id: rand(User.first.id..User.last.id))

