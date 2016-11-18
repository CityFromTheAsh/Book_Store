class Book < ApplicationRecord
  belongs_to :user
  has_one :order
  extend Enumerize
  enumerize :binding, in: {hardcover: true, softcover: false}
  paginates_per 5
  max_paginates_per 5

end
