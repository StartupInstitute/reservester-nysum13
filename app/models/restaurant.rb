class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image

  validates :name, :presence => true
  validates :address, :presence => true
  validates :phone, :presence => true, :length => {:minimum => 10}

  mount_uploader :image, RestimgUploader

end
