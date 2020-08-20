require 'faker'

Box.destroy_all
User.destroy_all

10.times do
  user = User.new(
    email: Faker::Internet.email, 
    password: Faker::Internet.password,
    first_name:Faker::Name.first_name,
    last_name:Faker::Name.last_name)
  user.save
end

User.create(email: "mail.jp@protonmail.com", password: 123456)

10.times do
  box = Box.new(
    name: Faker::Hipster.word,
    content: Faker::Hipster.paragraph, 
    price: rand(1...12),
    user_id:rand(User.first.id..User.last.id),
    address:Faker::Address.full_address,
    weight:rand(1...10)
  )
  box.save
end


#Please leave the seeds from here so we can test on that real names
Box.create(
  name: "Apple Box",
  content: "Our fresh apples", 
  price: rand(1...12),
  user_id:rand(User.first.id..User.last.id),
  address:Faker::Address.full_address,
  weight:rand(1...10)
)



