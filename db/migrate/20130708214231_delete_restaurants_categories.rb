class DeleteRestaurantsCategories < ActiveRecord::Migration
  def up
  	drop_table :categories_restaurants
  end

  def down
  end
end
