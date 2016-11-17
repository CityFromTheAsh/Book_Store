module OrdersHelper
  def add_new_order(order, book, book_id, admin)
    order = Order.new
    # #todo check bought book
    # book = Book.find(book_id)
    # order.book_id = book
    # order.title = book.title
    # order.price = book.price
    # book.book_for_sell = false
    # book.save
    # order.buyer = current_user.login
    # order.seller = book.owner
    # order.admin = admin
    # order.save
  end
end
