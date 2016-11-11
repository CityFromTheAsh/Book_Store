class RenameAccountsToUsers < ActiveRecord::Migration[5.0]
  def change
    if ActiveRecord::Base.connection.table_exists? 'users'
      drop_table :users
    end
    rename_table :accounts, :users
  end
end
