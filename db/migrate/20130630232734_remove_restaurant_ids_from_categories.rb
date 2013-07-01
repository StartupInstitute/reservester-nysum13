class RemoveRestaurantIdsFromCategories < ActiveRecord::Migration
  def up
    remove_column :categories, :restaurant_id
  end

  def down
    add_column :categories, :restaurant_id
  end
end
