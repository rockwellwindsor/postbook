# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Generate some fake users
# int = 1
# 35.times do
#   id = int
#   first_name = Faker::Superhero.prefix
#   last_name = Faker::Superhero.name
#   email = "#{first_name}_the_great#{id}@#{first_name}.com"
#   password = "password"
#   User.create!(id: = id, first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password, confirmed_at: Time.now)
#   int += 1
# end

# Generate some fake posts
# 75.times do 
#   title = Faker::Book.title
#   body = Faker::ChuckNorris.fact
#   user = rand(44...78)
#   Post.create!(title: title, body: body, user_id: user)
# end