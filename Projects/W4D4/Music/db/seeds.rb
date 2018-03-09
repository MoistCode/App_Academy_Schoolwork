# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


20.times do
  Band.create(name: Faker::RockBand.name)
end

100.times do
  Album.create(
    title: Faker::LeagueOfLegends.champion,
    year: (1990..2018).to_a.sample,
    band_id: rand(20) + 1,
    status: ["LIVE", "STUDIO"].sample
  )
end

500.times do
  Track.create(
    title: Faker::Name.first_name,
    album_id: rand(100) + 1
  )
end
