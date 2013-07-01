class Restaurant < ActiveRecord::Base
	
  attr_accessible :address, :description, :name, :phone, :image, :menu

  validates_presence_of :name, :address, :description, :phone
	validates_uniqueness_of :address, :case_sensitive => false
	validates_uniqueness_of :phone
	validates_format_of :phone, :with => /\A[0-9]{10}\Z/
	
  mount_uploader :image, ImageUploader

  mount_uploader :menu, MenuUploader

  belongs_to :owner
end
