class AddParamsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :books_sold, :integer, default: 0
    add_column :users, :books_bought, :integer, default: 0
    add_column :users, :reputation, :float, default: 0
  end
end
