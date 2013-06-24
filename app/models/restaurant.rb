class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache

  mount_uploader :photo, PhotoUploader

end
