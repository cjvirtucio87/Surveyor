class Response < ApplicationRecord
  belongs_to :survey
  has_many :questions, through: :survey
  has_many :multi_choices, through: :survey
  has_many :single_choices, through: :survey
  has_many :number_ranges, through: :survey
  
  has_many :option_choices
  has_many :number_choices
end
