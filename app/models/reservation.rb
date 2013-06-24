# == Schema Information
#
# Table name: reservations
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Reservation < ActiveRecord::Base
  attr_accessible :restaurant_id
  belongs_to :restaurant
end
