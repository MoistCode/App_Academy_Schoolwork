# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times { User.create(username: Faker::Name.name) }

30.times { Artwork.create(title: Faker::ChuckNorris.fact, artist_id: rand(20) + 1, image_url: Faker::Internet.url) }

50.times { ArtworkShare.create(viewer_id: rand(20) + 1, artwork_id: rand(30) + 1)}

30.times { Comment.create(commenter_id: rand(20) + 1, artwork_id: rand(30) + 1, comment_body: Faker::FamilyGuy.quote)}
