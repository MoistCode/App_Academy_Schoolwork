# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: "Tommy")
User.create!(username: "TingTing")

20.times{User.create!(username: Faker::Pokemon.name)}
20.times{AnswerChoice.create!(answer: Faker::VForVendetta.quote)}


Question.create(poll_question: "How now brown cow?")
Question.create(poll_question: "Who is that Pokemon?")
Question.create(poll_question: "To be or not to be?")
Question.create(poll_question: "Who questions much, shall learn much?")



Poll.create!(title: "Funky Questions")
Poll.create!(title: "Pokemon Descrimination")

# User id and Answer id

10.times {Response.create!(user_id: (rand(20) + 1), answer_choice_id: (rand(20) + 1))}
