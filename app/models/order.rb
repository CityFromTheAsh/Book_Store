class Order < ApplicationRecord
  belongs_to :user
  has_one :book
  accepts_nested_attributes_for :book
end
