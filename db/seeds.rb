gem 'faker'
5.times do |i|
  user = User.new(
    email: Faker::Internet.email, 
    username: Faker::Internet.username, 
    password: Faker::Internet.password)
  )
end
