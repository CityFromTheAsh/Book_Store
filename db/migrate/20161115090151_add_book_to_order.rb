class AddBookToOrder < ActiveRecord::Migration[5.0]
  def change
    add_reference :orders, :book, index: true, foreign_key: true
  end
end
