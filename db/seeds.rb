require 'faker'

Box.destroy_all
User.destroy_all

10.times do
  user = User.new(
    email: Faker::Internet.email, 
    password: Faker::Internet.password)
  user.save
end

10.times do
  box = Box.new(
    content: Faker::Hipster.paragraph, 
    price: Faker::Number.decimal(l_digits: 2), 
    user_id:rand(User.first.id..User.last.id)
  )
  box.save
end
