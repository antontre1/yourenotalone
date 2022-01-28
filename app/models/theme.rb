class Theme < ApplicationRecord
  has_many :articles
  has_many :favorites, as: :favoritable
end
