class RenameBooksIdInBooksToBookId < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :books_id, :book_id
  end
end
