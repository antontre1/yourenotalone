class Favorite < ApplicationRecord
  searchkick language: "french"
  belongs_to :user
  belongs_to :favoritable, polymorphic: true
end
