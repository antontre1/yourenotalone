class Vote < ApplicationRecord
  belongs_to :users
  belongs_to :articles

  validates :reaction, presence: true
end
