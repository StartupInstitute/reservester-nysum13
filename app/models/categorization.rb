class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :restaurant_id
  belongs_to :restaurant
  belongs_to :category
end
