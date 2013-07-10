class AddCalendarToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :calendar, :string
  end
end
