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
  
  def format_time(time)
    case time
    when 1
      "1 AM"
    when 2
      "2 AM"
    when 3
      "3 AM"
    when 4
      "4 AM"
    when 5
      "5 AM"
    when 6
      "6 AM"
    when 7
      "7 AM"
    when 8
      "8 AM"
    when 9
      "9 AM"
    when 10
      "10 AM"
    when 11
      "11 AM"
    when 12
      "12 PM"
    when 13
      "1 PM"
    when 14
      "2 PM"
    when 15
      "3 PM"
    when 16
      "4 PM"
    when 17
      "5 PM"
    when 18
      "6 PM"
    when 19
      "7 PM"
    when 20
      "8 PM"
    when 21
      "9 PM"
    when 22
      "10 PM"
    when 23
      "11 PM"
    when 24
      "12 AM"
    end
  end

end


