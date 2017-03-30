# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Generate some fake users
# 5.times do
#   id = rand(1..500)
#   first_name = Faker::Superhero.prefix
#   last_name = Faker::Superhero.name
#   email = "#{first_name}_the_great_#{id}@user.com"
#   password = "password"
#   User.create!(id: id, first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password, confirmed_at: Time.now)
# end

# Generate some fake posts
# 25.times do
#   id = rand(1..350)
#   title = Faker::Book.title
#   body = Faker::ChuckNorris.fact
#   user = User.first
#   Post.create!(id: id, title: title, body: body, user_id: user.id)
# end