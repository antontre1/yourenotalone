class Article < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :comments
  has_many :votes
end
