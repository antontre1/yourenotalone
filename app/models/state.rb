class State < ApplicationRecord
  has_many :users
  validates :emotional_state, presence: true
end
