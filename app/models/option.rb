class Option < ApplicationRecord
  belongs_to :optionable, polymorphic: true,
                          inverse_of: :options,
                          counter_cache: true
end
