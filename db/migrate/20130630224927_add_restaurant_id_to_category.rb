class AddRestaurantIdToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :restaurant_id, :integer
  end
end
