class Reservation < ActiveRecord::Base
  attr_accessible :name, :date, :time

  belongs_to :restaurant

  validates :name, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validate :free_table

  def free_table
  	errors.add(:base, "Restaurant does not have enough tables!") if (self.restaurant.max_tables < self.restaurant.reservations.count+1)
  end
end
