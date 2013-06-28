class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache

  belongs_to :owner
  has_many :reservations

  validates :name, :presence => true
  validates :phone, :presence => true

  mount_uploader :photo, PhotoUploader

end
