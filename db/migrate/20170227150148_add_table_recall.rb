class AddTableRecall < ActiveRecord::Migration[5.0]
  def change
    create_table :recall do |t|
      t.text :recall
      t.integer :mark

      t.timestamps
    end
  end
end
