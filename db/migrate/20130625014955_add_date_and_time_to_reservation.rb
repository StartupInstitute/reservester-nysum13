class AddDateAndTimeToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :date, :date
    add_column :reservations, :time, :integer
  end
end
