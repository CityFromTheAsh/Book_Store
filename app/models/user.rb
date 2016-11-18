class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :login, presence: true, uniqueness: true
  has_many :books
  has_many :orders
  mount_uploader :avatar, AvatarUploader
  paginates_per 5
  max_paginates_per 5
end
