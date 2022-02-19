class Article < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :title, :content, presence: true
  validates :title, length: { minimum: 4 }
  validates :content, length: { minimum: 20 }
  has_one_attached :picture
end
