class Theme < ApplicationRecord
  has_many :articles
  has_many :favorites, as: :favoritable

  validates :title, length: { minimum: 2, maximum: 500 }
end
