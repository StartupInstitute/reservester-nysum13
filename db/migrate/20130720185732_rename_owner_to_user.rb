class RenameOwnerToUser < ActiveRecord::Migration
  def change
    rename_table :owners, :users
  end

end
