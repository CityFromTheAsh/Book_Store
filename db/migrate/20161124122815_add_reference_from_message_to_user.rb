class AddReferenceFromMessageToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :user, index: true, foreign_key: true, name:'author'
  end
end
