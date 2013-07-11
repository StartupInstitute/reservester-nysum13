class Renameusers < ActiveRecord::Migration
  def up
  	rename_table :users, :users
  end

  def down
  	rename_table :users, :users
  end
end
