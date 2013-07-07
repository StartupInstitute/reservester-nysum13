class CreateCategoriesRestaurantsJoinTable < ActiveRecord::Migration
  def change
    create_table :categories_restaurants, id: false do |t|
      t.integer :category_id
      t.integer :resturant_id
    end
  end
end
