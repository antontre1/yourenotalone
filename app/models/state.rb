class State < ApplicationRecord
  has_many :users
  enum state: { happy: 0, hopeful: 1, sociable: 2, introvert: 3 }
end
