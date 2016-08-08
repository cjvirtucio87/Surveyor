class Question < ApplicationRecord
  belongs_to :survey, counter_cache: true
  belongs_to :questionable, polymorphic: true
end