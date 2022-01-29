class State < ApplicationRecord
  has_many :users
  enum state: { happy: 0, hopeful: 1, sociable: 2, introvert: 3 }
  validates :emotional_state, presence: true
  # validates :size, inclusion: { in: sizes.keys }
  # TABLE_SMILEY = {
  #   { 1 : "😀" }
  # }
end
