class AddImageToRests < ActiveRecord::Migration
  def change
    add_column :rests, :image, :string
  end
end
