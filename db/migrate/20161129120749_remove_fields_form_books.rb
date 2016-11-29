class RemoveFieldsFormBooks < ActiveRecord::Migration[5.0]
  def change
    remove_columns :books, :owner, :date_of_realize
  end
end
