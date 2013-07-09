class ChangeOpenAndCloseTimeColumnTypes < ActiveRecord::Migration
  def up
    change_column :restaurants, :open_time, :integer
    change_column :restaurants, :close_time, :integer
  end

  def down
    change_column :restaurants, :open_time, :time
    change_column :restaurants, :close_time, :time
  end
end
