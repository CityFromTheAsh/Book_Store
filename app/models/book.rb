class Book < ApplicationRecord
  extend Enumerize

  has_many :images
  has_many :messages
  belongs_to :user
  has_one :order
  accepts_nested_attributes_for :images

  enumerize :binding, in: {hardcover: true, softcover: false}
  enumerize :status, in: %w(for_sale payment delivery control sold banned)

  paginates_per 5
  max_paginates_per 5

  validates :title, :price, :author, presence: true
end
