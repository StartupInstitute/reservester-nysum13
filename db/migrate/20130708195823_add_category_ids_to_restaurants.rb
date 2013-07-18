class AddCategoryIdsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :category_ids, :integer
  end
end
