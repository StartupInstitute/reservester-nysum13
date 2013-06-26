class Reservation < ActiveRecord::Base
  attr_accessible :email, :message, :reserve_on, :restaurant_id
end
