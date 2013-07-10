class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations, :id => false do |t|
      t.references :restaurant
      t.references :category
    end
    add_index :categorizations, [:restaurant_id, :category_id]
    add_index :categorizations, [:category_id, :restaurant_id]
  end
end
