class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :login, presence: true, uniqueness: true
  has_many :books
  has_many :orders

  def admin?
    return true if current_user.present? && current_user.admin
    false
  end
end
