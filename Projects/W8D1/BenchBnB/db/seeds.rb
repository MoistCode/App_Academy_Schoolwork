# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def random_int
  sym = rand(2)
  int = rand(100)
  sym == 1 ? "#{int}" : "-#{int}"
end

def random_decimals
  dec = rand(999999)
  dec.to_s
end

def parse_coords
  "#{random_int}.#{random_decimals}".to_f
end

100.times do
  Bench.create!(
    description: Faker::ChuckNorris.fact,
    longitude: parse_coords,
    latitude: parse_coords,
  )
end
