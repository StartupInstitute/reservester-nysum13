class Categorization < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :category_id, :restaurant_id
  
  belongs_to :category#, foreign_key: "category_id"

  belongs_to :restaurant#, foreign_key: "restaurant_id"
end
