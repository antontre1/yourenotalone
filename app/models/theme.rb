class Theme < ApplicationRecord
  searchkick searchable: [:title, :description]
  has_many :articles
  has_many :favorites, as: :favoritable

  validates :title, length: { minimum: 2, maximum: 75 }
  has_one_attached :picture
end
