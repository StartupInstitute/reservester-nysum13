class Reservation < ActiveRecord::Base
  attr_accessible :name, :date, :time

  belongs_to :restaurant

  validates :date, presence: true
  validates :time, presence: true
  validates :name, presence: true

  def return_restaurant_name
  	return :restaurant.name
  end

end
