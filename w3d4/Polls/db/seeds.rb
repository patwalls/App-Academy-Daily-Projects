# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'


50.times do
  User.create!({name: Faker::Name.name})
end

100.times do
  Poll.create!(title: Faker::Hipster.sentence, author_id: User.order("RANDOM()").first.id )
end

200.times do
  Question.create!(text: Faker::Hipster.sentence(3), poll_id: Poll.order("RANDOM()").first.id )
end

400.times do
  AnswerChoice.create!(text: Faker::Hipster.word, question_id: Question.order("RANDOM()").first.id )
end

800.times do
  Response.create!( answer_choice_id: AnswerChoice.order("RANDOM()").first.id, user_id: User.order("RANDOM()").first.id)
end
