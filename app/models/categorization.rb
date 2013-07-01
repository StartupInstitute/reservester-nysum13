class Categorization < ActiveRecord::Base
  attr_accessible :category_id, :restaurant_id
  belongs_to :category
  belongs_to :restaurant
end
