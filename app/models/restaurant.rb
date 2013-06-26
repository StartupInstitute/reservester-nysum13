class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache

  belongs_to :owner

  validates :name, :presence => true
  validates :phone, :presence => true

  mount_uploader :photo, PhotoUploader

end
