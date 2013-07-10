class RemoveCalendarFromRestaurants < ActiveRecord::Migration
  def up
  	remove_column :restaurants, :calendar
  end

  def down
  	add_column :restaurants, :calendar, :text
  end
end
