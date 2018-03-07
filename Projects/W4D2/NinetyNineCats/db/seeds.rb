# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do

  Cat.create(
    name: Faker::Name.first_name,
    birth_date: Faker::Date.between(100.days.ago, Date.today),
    sex: %w(M F).sample,
    color: %w(orange black grey).sample,
    description: Faker::HeyArnold.quote
  )


end

CatRentalRequest.create(
  cat_id: 5,
  start_date: Faker::Date.between(10.days.ago, 5.days.ago),
  end_date: Faker::Date.between(4.days.ago, Date.today)
 )

 CatRentalRequest.create(
   cat_id: 5,
   start_date: Faker::Date.between(50.days.ago, 40.days.ago),
   end_date: Faker::Date.between(41.days.ago, 30.days.ago)
  )

  CatRentalRequest.create(
    cat_id: 5,
    start_date: Faker::Date.between(100.days.ago, 90.days.ago),
    end_date: Faker::Date.between(91.days.ago, 80.days.ago)
   )
