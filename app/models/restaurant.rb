class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image, :menu
  
  mount_uploader :image, ImageUploader

  mount_uploader :menu, MenuUploader
end
