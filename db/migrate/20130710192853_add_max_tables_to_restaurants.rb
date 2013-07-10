class AddMaxTablesToRestaurants < ActiveRecord::Migration
  def change
  	add_column :restaurants, :max_tables, :integer
  end
end
