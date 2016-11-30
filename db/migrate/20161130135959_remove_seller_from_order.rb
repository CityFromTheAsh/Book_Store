class RemoveSellerFromOrder < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :seller
  end
end
