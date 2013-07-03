class AddCategoryIdToCategorization < ActiveRecord::Migration
  def change
    add_column :categorizations, :category_id, :integer
  end
end
