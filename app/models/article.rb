class Article < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :comments
  has_many :votes

  validates :title, :content, presence: true
  validates :title, length: { minimum: 4 }
  validates :content, length: { minimum: 20 }
end
