class Reservation < ActiveRecord::Base
  attr_accessible :reservation_date, :reservation_time, :reserver_name , :reserver_email

  belongs_to :restaurant
end
