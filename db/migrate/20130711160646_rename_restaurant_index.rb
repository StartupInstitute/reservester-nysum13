class RenameRestaurantIndex < ActiveRecord::Migration
  def up
  	rename_index :users, "index_users_on_reset_password_token", "index_users_on_reset_password_token"
  end

  def down
  	rename_index :users, "index_users_on_reset_password_token", "index_users_on_reset_password_token"
  end
end
