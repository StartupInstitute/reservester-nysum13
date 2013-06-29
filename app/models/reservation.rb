class Reservation < ActiveRecord::Base
  attr_accessible :name, :datetime

  belongs_to :restaurant

  validates :datetime, :presence => true
  validates :name, :presence => true

end
