class Book < ApplicationRecord
  extend Enumerize

  has_many :images
  has_many :messages
  belongs_to :user
  has_one :order
  accepts_nested_attributes_for :images

  enumerize :binding, in: {hardcover: true, softcover: false} if I18n.locale == :en
  enumerize :binding, in: {твёрдый: true, мягкий: false} if I18n.locale == :ru
  enumerize :status, in: %w(for_sale payment delivery control sold banned)

  paginates_per 5
  max_paginates_per 5

  validates :title, :price, :author, presence: true
end
