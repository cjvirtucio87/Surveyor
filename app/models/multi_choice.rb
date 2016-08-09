class MultiChoice < ApplicationRecord
  has_many :options, as: :optionable
  has_many :questions, as: :questionable

  accepts_nested_attributes_for :options

end
