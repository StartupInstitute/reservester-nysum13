class ChangeOpenAndCloseTimesFormat < ActiveRecord::Migration
  def up
    change_column :restaurants, :open_time, :time
    change_column :restaurants, :close_time, :time
  end

  def down
    change_column :restaurants, :open_time, :integer
    change_column :restaurants, :close_time, :integer
  end
end
