class AddStatusToBook < ActiveRecord::Migration[5.0]
  def change
    remove_column :books, :book_for_sell, :boolean, null: false, default: true
    add_column :books, :status, :string, null: false, default: "for sale"
  end
end
