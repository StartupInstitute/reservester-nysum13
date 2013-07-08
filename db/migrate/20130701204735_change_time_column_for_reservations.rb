class ChangeTimeColumnForReservations < ActiveRecord::Migration
  def change
  	change_column :reservations, :reserved_at, :time
  end
end
