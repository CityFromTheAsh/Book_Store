class ConnectOptionsAndUser < ActiveRecord::Migration[5.0]
  def change
    add_reference(:users, :option)
    add_reference(:options, :user)
  end
end
