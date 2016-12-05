class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :books
  has_many :orders
  has_many :messages
  has_one  :last_bought_book, class_name: 'Book'

  mount_uploader :avatar, AvatarUploader

  paginates_per 5
  max_paginates_per 5

  validates :login, presence: true, uniqueness: true
end
