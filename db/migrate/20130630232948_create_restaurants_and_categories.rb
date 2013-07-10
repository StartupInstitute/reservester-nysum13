class CreateRestaurantsAndCategories < ActiveRecord::Migration
  def up
    create_table :categories_restaurants, id: false do |t|
      t.references :restaurant
      t.references :category
    end
    add_index :categories_restaurants, [:category_id, :restaurant_id]
  end

  def down
    drop_table :categories_restaurants
  end
end
