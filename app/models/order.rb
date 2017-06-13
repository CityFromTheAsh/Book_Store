class Order < ApplicationRecord
  extend Enumerize

  belongs_to :user
  has_one :book
  accepts_nested_attributes_for :book

  enumerize :status, in: %w(for_sale payment delivery control sold banned)
end
