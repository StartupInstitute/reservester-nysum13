class ChangeIntegerFormatInReservation < ActiveRecord::Migration
  def up
    change_column :reservations, :time, :time, :default => "UTC"
  end

  def down
    change_column :reservations, :time, :integer
  end
end
