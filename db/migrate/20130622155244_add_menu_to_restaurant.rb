class AddMenuToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :menu, :string
  end
end
