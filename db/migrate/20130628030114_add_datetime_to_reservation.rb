class AddDatetimeToReservation < ActiveRecord::Migration
  def change
  	add_column :reservations, :datetime, :datetime
  end
end
