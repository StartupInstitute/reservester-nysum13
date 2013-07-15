class Reservation < ActiveRecord::Base
  attr_accessible :date, :email, :name, :phone, :time
  belongs_to :restaurant
 
end
