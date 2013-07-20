class AddRpxToUsers < ActiveRecord::Migration
  def change
    add_column :owners, :rpx_identifier, :string
  end
end
