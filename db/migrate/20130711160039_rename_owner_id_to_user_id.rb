class RenameuserIdToUserId < ActiveRecord::Migration
  def up
  	rename_column :restaurants, :user_id, :user_id
  	rename_index :users, "index_users_on_email", "index_users_on_email"
  end

  def down
  	rename_column :restaurants, :user_id, :user_id
  	rename_index :users, "index_users_on_email", "index_users_on_email"
  end
end
