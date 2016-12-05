class Order < ApplicationRecord
  extend Enumerize

  belongs_to :user
  has_one :book
  accepts_nested_attributes_for :book

  enumerize :status, in: %w(for_sale payment delivery control sold banned)

  def pay_for_book(user, book)
    Order.transaction do
      user.update(balance: user.balance - book.price)
      book.update(status: user.balance < 0 ? :payment : :delivery)
    end
  end
end
