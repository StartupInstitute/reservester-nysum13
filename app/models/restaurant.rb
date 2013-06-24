class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache, :owner

  belongs_to :owner

  validates :name, :owner, :presence => true

  mount_uploader :photo, PhotoUploader

end
