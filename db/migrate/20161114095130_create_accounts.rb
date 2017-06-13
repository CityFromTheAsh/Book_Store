class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :login
      t.string :product
      t.decimal :price
      t.string :about
      t.boolean :buy_sell

      t.timestamps
    end
  end
end
