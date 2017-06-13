class AddReferenceFromMessageToBook < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :message, index: true, foreign_key: true
    add_reference :messages, :books, index: true, foreign_key: true
  end
end
