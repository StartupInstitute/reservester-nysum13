class DropDateAndTimeFromReservations < ActiveRecord::Migration
  def up
    remove_column :reservations, :time
    remove_column :reservations, :date
  end

  def down
    add_column :reservations, :time
    add_column :reservations, :date
  end
end
