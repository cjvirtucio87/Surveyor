class NumberRange < ApplicationRecord
  has_many :questions, as: :questionable
end
