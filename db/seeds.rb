# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Survey.destroy_all
MultiChoice.destroy_all
SingleChoice.destroy_all
NumberRange.destroy_all
Option.destroy_all
Question.destroy_all

puts "Building Surveys.."
10.times do |i|
  s = Survey.create!(title: "Survey##{i}",
                     description: "This is a survey (#{i})")

  # Make a multichoice question.
  puts "MCQ ##{i}.."
  mcq = MultiChoice.new(description: "What are your favorite colors?")
  mcq.save!
  4.times do
    mcq.options.create!(description: "#{Faker::Color.color_name}")
  end
  mcq.questions.create!(survey_id: s.id)

  # Make a singlechoice question.
  puts "SCQ ##{i}.."
  scq = SingleChoice.new(description: "What's your favorite book?")
  scq.save!
  4.times do
    scq.options.create!(description: "#{Faker::Book.title}, by #{Faker::Book.author}")
  end
  scq.questions.create!(survey_id: s.id)

  # Make a numberrange question.
  puts "Number Range ##{i}.."
  num = [3,5,7].sample
  n = NumberRange.create!(description: "Rate this on a scale of 1 to #{num} (#{num} being the highest", max: num)
  n.questions.create!(survey_id: n.id)
end