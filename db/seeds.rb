# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# # Generate some fake users
35.times do
  id = rand(1...350)
  first_name = Faker::Superhero.prefix
  last_name = Faker::Superhero.name
  email = "#{first_name}_the_great#{id}@#{first_name}.com"
  password = "password"
  User.create!(first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password, confirmed_at: Time.now)
end

# Generate some fake posts
75.times do 
  title = Faker::Book.title
  body = Faker::ChuckNorris.fact
  user = User.find(1...35)
  Post.create!(title: title, body: body, user_id: user.id)
end