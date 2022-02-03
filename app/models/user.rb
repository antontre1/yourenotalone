class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  has_many :comments
  validates :username, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :favorites, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :state
  has_one_attached :picture

end
