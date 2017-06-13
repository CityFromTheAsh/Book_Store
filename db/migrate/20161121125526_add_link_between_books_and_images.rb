class AddLinkBetweenBooksAndImages < ActiveRecord::Migration[5.0]
  def change
    add_reference :images, :book, foreign_key: true
    add_reference :books, :image, foreign_key: true
  end
end
