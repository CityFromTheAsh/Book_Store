class Book < ApplicationRecord
  belongs_to :user
  has_one :order
  extend Enumerize
  enumerize :binding, in: {hardcover: true, softcover: false}
end
