class Book < ApplicationRecord
  belongs_to :user
  has_one :order
  extend Enumerize
  enumerize :binding, in: {hardcover: true, softcover: false}
  paginates_per 5
  max_paginates_per 5
  has_many :images
  accepts_nested_attributes_for :images
  validates :title, presence: true
  validates :price, presence: true
  validates  :author, presence: true
  has_many :messages
end
