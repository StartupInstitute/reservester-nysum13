class Reservation < ActiveRecord::Base
  attr_accessible :name
  belongs_to :rest
end
