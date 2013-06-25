# == Schema Information
#
# Table name: reservations
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  date          :date
#  time          :integer
#

class Reservation < ActiveRecord::Base
  attr_accessible :restaurant_id, :date, :time
  belongs_to :restaurant
  # after_create :update_inventory
  
  # def update_inventory
  #   self.restaurant.inventory[self.time]-=1
  # end

end


