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
  
  # validate :restaurant_is_not_overbooked
  # validate :user_has_not_reserved
  # after_create :reduce_table_qty
  
  scope :during, ->(time_of_day) {
    hour_of_day = time_of_day.change(min: 0) # e.g. 2:15pm -> 2:00pm
    
    where(
      "reserve_on >= ? AND reserve_on <= ?",
      hour_of_day,
      hour_of_day + 59.minutes
    )
  }
  
  # protected
    
    # def restaurant_is_not_overbooked
    #   if restaurant.full?(reserve_on)
    #     errors.add(:restaurant, "is overbooked")
    #   end
    # end
    
    # def user_has_not_reserved
    #   if Reservation.during(reserve_on).where(user_id: user_id, restaurant_id: restaurant_id).count > 0
    #     errors.add(:restaurant, "user already reserved")
    #   end
    # end
    
    # def reduce_table_qty
    #   restaurant.table_qty -= 1
    # end
end


