class AddRestaurantIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :restaurant_id, :interger
  end
end
