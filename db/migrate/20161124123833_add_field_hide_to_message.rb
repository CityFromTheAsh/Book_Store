class AddFieldHideToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :hide, :boolean, null: false,  default: false
  end
end
