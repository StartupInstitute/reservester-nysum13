class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image, :remote_image_url, :menu

  mount_uploader :image, ImageUploader
  mount_uploader :menu, MenuUploader

  belongs_to :owner

  validates :name, :presence => true, :uniqueness => true
end
