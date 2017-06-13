class AddFieldLoginToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :login, :string, null: false, default: "", unique: true
  end
end
