class AddUserIdRestaurantIdAndOwnerIdToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :user_id, :integer
    add_column :reservations, :owner_id, :integer
  end
end
