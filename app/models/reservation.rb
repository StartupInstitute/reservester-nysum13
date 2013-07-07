class Reservation < ActiveRecord::Base
  attr_accessible :reservetime, :restaurant_id, :status, :approved_at, :email, :phone, :message

	belongs_to :restaurant

	validates :reservetime, :presence => true
  validates :email, :presence => true, :email => true
  validates_presence_of :phone
end
