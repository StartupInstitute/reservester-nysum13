class Reservation < ActiveRecord::Base
  attr_accessible :name, :datetime

  belongs_to :restaurant

  validates :datetime, presence: true
  validates :name, presence: true

  def return_restaurant_name
  	return :restaurant.name
  end

end
