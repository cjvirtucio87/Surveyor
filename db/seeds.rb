# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do |i|
  Survey.create!(title: "Survey##{i}",
                 description: "This is a survey")
end

10.times do |i|
  10.times do |j|
    MultiChoice.create!(description: "This is a MultiChoice question")
  end

  10.times do |j|
    SingleChoice.create!(description: "This is a SingleChoice question")
  end

  10.times do |j|
    NumberRange.create!(description: "This is a Number Range",
                        min: 1, max: [3,5,10].sample)
  end

  10.times do |i|
    option_count = [4,5].sample
    model = %w{ MultiChoice SingleChoice }.sample
                                          .constantize
    offset = rand(model.count)
    row = model.offset(offset).first
    options = []
    option_count.times do |j|
      options << Option.new(description: "This is option ##{j}.")
    end
    row.options = options
    NumberRange.create!(min: 1, max: [5,10].sample)
  end

  survey_id = Survey.pluck(:id).sample
  question = %w{ MultiChoice SingleChoice NumberRange }.sample
  question_id = question.constantize.pluck(:id).sample
  # Store the parent row in the polymorphic identifier.
  # Rails will take care of the rest.
  Question.create!(survey_id: survey_id,
                   questionable: question.constantize.find(question_id))
end
