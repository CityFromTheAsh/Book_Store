class AddReferencesFromMessagesToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :sender, references: :users, index: true
    add_foreign_key :messages, :users, column: :sender_id
    add_reference :messages, :recipient, references: :users, index: true
    add_foreign_key :messages, :users, column: :recipient_id
  end
end
