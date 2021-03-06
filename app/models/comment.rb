class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates :content, length: { minimum: 1, maximum: 600 }
end
