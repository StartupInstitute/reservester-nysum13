class AddOpenTimeAndCloseTimeAndTableQtyToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :open_time, :integer
    add_column :restaurants, :close_time, :integer
    add_column :restaurants, :table_qty, :integer
  end
end
