class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image
  mount_uploader :image, ImageUploader
end
