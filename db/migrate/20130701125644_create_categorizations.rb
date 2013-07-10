class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :category_id
      t.integer :restaurant_id

      t.timestamps
    end
    add_index :categorizations, [:category_id, :restaurant_id]
  end
end
