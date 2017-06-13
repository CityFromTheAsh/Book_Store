class AddReferenceFromUserToMessage < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :message, index: true, foreign_key: true
  end
end
