class State < ApplicationRecord
  has_many :users
  validates :emotional_state, presence: true

  # TABLE_SMILEY = {
  #   { 1 : "😀" }
  # }
end
