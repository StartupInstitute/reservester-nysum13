class AddTimeToReservation < ActiveRecord::Migration
  def change
  	add_column :reservations, :reservation_time, :datetime
  end
end
