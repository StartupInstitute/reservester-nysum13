class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache, :owner

  belongs_to :owner

  mount_uploader :photo, PhotoUploader

end
