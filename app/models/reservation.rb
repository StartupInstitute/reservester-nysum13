class Reservation < ActiveRecord::Base
  attr_accessible :name, :reserved_at, :reserved_on, :restaurant_id
  belongs_to :restaurant

  validates :name, :presence => true
  validate :restaurant_not_overbooked
end
