class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image, :remote_image_url

  validates :name, :presence => true
  validates :address, :presence => true
  validates :phone, :numericality => true, :presence => true, :length => {:minimum => 10}
  validates :owner_id, :presence => true

  mount_uploader :image, RestimgUploader

  belongs_to :owner

end
