class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.decimal :price
      t.integer :page_count
      t.string :about
      t.string :owner
      t.datetime :date_of_realize
      t.boolean :binding
      t.string :genre
      t.boolean :book_for_sell

      t.timestamps
    end
  end
end
