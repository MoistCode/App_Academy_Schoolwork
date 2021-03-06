# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times { User.create(email: Faker::Internet.email) }


100.times { ShortenedUrl.create_with_user(User.find((rand(100) + 1)), Faker::Internet.url)  }

50.times { Visit.record_visit!(User.find((rand(100) + 1)), ShortenedUrl.find((rand(100) + 1))) }
