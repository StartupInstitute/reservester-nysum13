class Reservation < ActiveRecord::Base
  attr_accessible :name, :reserved_for, :restaurant_id, :email
  belongs_to :restaurant

  validates :name, :presence => true
  validates :email, :presence => true,  
            :email_format => {:message => 'invalid address'}

  #validate :restaurant_not_overbooked

  # scope :during, ->(time_of_day) {
  # 	hour_of_day = time_of_day.change(min: 0) # e.g. 2:15pm -> 2:00pm

  # 	where(
  # 		"reserved_at >= ? AND reserved_at <= ?", 
  # 		hour_of_day,
  # 		hour_of_day + 59.minutes
  # 	)
  # }

  # protected

  # def restaurant_is_not_overbooked
  # 	if restaurant.full?(reserved_at)
  # 		errors.add(:restaurant, "is overbooked")
  # 	end
  # end
end
