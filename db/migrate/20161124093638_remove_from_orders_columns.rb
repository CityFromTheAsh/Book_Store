class RemoveFromOrdersColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :title
    remove_column :orders, :price
  end
end
