class Reservation < ActiveRecord::Base
  attr_accessible :username, :reservation_time
  belongs_to :rest
end
