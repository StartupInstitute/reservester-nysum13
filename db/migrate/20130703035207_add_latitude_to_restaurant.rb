class AddLatitudeToRestaurant < ActiveRecord::Migration
  def change
  	add_column :restaurants, :latitude, :float #you can change the name, see wiki
		add_column :restaurants, :longitude, :float #you can change the name, see wiki
		add_column :restaurants, :gmaps, :boolean #not mandatory, see wiki
  end
end
