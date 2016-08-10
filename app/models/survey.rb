class Survey < ApplicationRecord
  has_many :questions
  has_many :responses

  # Access to MCQs
  has_many :multi_choices, through: :questions,
                           source: :questionable,
                           source_type: 'MultiChoice'

  # Access to SCQs
  has_many :single_choices, through: :questions,
                           source: :questionable,
                           source_type: 'SingleChoice'
  
  # Access to Number Ranges
  has_many :number_ranges, through: :questions,
                           source: :questionable,
                           source_type: 'NumberRange'
end
