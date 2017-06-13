class AddTableOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
      t.string :language
      t.integer :book_per_page, default: 25

      t.timestamps
    end
  end
end
