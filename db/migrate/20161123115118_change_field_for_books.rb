class ChangeFieldForBooks < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :book_for_sell, :boolean
    add_column :books, :book_for_sell, :boolean, null: false, default: true
  end
end
