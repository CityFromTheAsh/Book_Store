class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :firstname, null: false, default: ""
      t.string :lastname, null: false, default: ""
      t.string :email, null: false, default: ""
      t.timestamps
    end
  end
end
