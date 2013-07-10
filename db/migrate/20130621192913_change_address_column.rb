class ChangeAddressColumn < ActiveRecord::Migration
  def up
    rename_column :restaurants, :address, :street
    add_column :restaurants, :city, :string
    add_column :restaurants, :state, :string
    add_column :restaurants, :zip, :string
    
  end

  def down
    rename_column :restaurants, :street, :address
    remove_column :restaurants, :city, :string
    remove_column :restaurants, :state, :string
    remove_column :restaurants, :zip, :string
  end
end
