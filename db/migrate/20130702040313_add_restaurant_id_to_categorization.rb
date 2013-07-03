class AddRestaurantIdToCategorization < ActiveRecord::Migration
  def change
    add_column :categorizations, :restaurant_id, :integer
  end
end
