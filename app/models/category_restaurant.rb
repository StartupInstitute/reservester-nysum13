class CategoryReservation < ActiveRecord::Base
  
  belongs_to :category
  
  belongs_to :reservation
end
