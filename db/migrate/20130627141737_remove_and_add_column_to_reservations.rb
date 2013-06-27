class RemoveAndAddColumnToReservations < ActiveRecord::Migration
  def up
    remove_column :reservations, :date
    remove_column :reservations, :time
    add_column :reservations, :reserve_on, :datetime
  end

  def down
    add_column :reservations, :date
    add_column :reservations, :time
    remove_column :reservations, :reserve_on
  end
end
