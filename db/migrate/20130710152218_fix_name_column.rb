class FixNameColumn < ActiveRecord::Migration
  def up
  	rename_column :reservations, :name, :username
  end

  def down
  end
end
