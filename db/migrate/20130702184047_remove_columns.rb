class RemoveColumns < ActiveRecord::Migration
  def up
  	remove_column :reservations, :reserved_on
  	remove_column :reservations, :reserved_at
  end

  def down
  end
end
