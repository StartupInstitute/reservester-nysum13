class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image, :remote_image_url
  mount_uploader :image, ImageUploader
  
end
