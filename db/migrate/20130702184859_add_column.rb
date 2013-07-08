class AddColumn < ActiveRecord::Migration
  def up
 	add_column :reservations, :reserved_for, :datetime
  end

  def down
  end
end
