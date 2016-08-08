class Option < ApplicationRecord
  belongs_to :optionable, polymorphic: true,
                          counter_cache: true
end
