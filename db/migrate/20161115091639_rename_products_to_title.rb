class RenameProductsToTitle < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :product, :title

  end
end
