class AddIndexToCategorizations < ActiveRecord::Migration
  def change
  	add_index :categorizations, :category_id
  	add_index :categorizations, :restaurant_id
  end
end
