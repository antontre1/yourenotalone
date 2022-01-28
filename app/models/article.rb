class Article < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :comments
end
