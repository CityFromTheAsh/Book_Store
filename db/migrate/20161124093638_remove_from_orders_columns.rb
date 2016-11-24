class RemoveFromOrdersColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :title, :string
    remove_column :orders, :price, :decimal
  end
end
