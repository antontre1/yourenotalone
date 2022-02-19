class Favorite < ApplicationRecord
  searchkick
  belongs_to :user
  belongs_to :favoritable, polymorphic: true
end
