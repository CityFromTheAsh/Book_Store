class AddReferenceFromUserToLastBoughtBook < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :last_bought_book, references: :users, index: true
    add_foreign_key :books, :users, column: :last_bought_book_id
  end
end
