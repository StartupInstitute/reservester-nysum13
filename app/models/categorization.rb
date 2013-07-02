class Categorization < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :category
  belongs_to :restaurant

end
