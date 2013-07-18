class DropRestaurantsCategoriesTable < ActiveRecord::Migration
  def up
  	drop_table :restaurants_categories
  end

  def down
  end
end
