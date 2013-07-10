# == Schema Information
#
# Table name: reservations
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  reserve_on    :datetime
#  user_id       :integer
#  owner_id      :integer
#


class Reservation < ActiveRecord::Base
  attr_accessible :restaurant_id, :reserve_on, :user_id, :owner_id
  belongs_to :restaurant
  belongs_to :user
  belongs_to :owner
  
  validates :user_id, presence: true
  validates :owner_id, presence: true
  validates :restaurant_id, presence: true
  
  apply_simple_captcha
  
  validate :restaurant_is_not_overbooked
  validate :user_has_not_reserved
  
  
  scope :availability, ->(reserve_on) {
    reservation = reserve_on.change(min: 0)
    
    where(
      "reserve_on >= ? AND reserve_on <= ?",
      reservation,
      reservation + 59.minutes
    )
  }
  
  scope :day, ->(reserve_on) {
    start_date = reserve_on.change(hour: 0)
    
    where(
      "reserve_on >= ? AND reserve_on <= ?",
      start_date,
      start_date + 23.hours + 59.minutes
    )
  }
  
  
  scope :during, ->(time_of_day) {
    hour_of_day = time_of_day.change(min: 0) # e.g. 2:15pm -> 2:00pm
    
    where(
      "reserve_on >= ? AND reserve_on <= ?",
      hour_of_day,
      hour_of_day + 59.minutes
    )
  }
  
  

  protected
  
    def restaurant_is_not_overbooked
      # Make the table qty dynamic by adding it as an attribute to the Restaurant model
      if Reservation.availability(reserve_on).count > 20
        errors.add(:reservation, "Restaurant is already overbooked for this date and time slot.")
      end
    end
    

    def user_has_not_reserved
      Reservation.day(reserve_on).each do |reservation|
        if reservation.user == self.user
          errors.add(:reservation, "User already reserved")
        end
      end
    end
    
end


