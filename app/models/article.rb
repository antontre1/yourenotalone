class Article < ApplicationRecord
  belongs_to :user
  belongs_to :theme
  has_many :comments, dependent: :delete_all
  validates :title, :content, presence: true
  validates :title, length: { minimum: 4 }
  validates :content, length: { minimum: 20 }
  has_one_attached :picture
end
