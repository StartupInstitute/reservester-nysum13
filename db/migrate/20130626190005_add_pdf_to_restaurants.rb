class AddPdfToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :pdf, :string
  end
end
