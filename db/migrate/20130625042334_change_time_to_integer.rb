class ChangeTimeToInteger < ActiveRecord::Migration
  def up
    change_column :reservations, :time, :integer
  end

  def down
    change_column :reservations, :time, :time
  end
end
