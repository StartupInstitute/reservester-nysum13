class ChangeDateToDate < ActiveRecord::Migration
  def up
  	change_column :reservations, :date, :date
  	change_column :reservations, :time, :time
  end

  def down
  	change_column :reservations, :date, :datetime
  	change_column :reservations, :time, :timetime
  end
end
