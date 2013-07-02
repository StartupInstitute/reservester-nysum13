class Restaurant < ActiveRecord::Base
	
  attr_accessible :address, :description, :name, :phone, :image, :menu

  validates_presence_of :name, :address, :description, :phone, :image
	validates_uniqueness_of :address, :case_sensitive => false
	validates_uniqueness_of :phone
	# Client side phone validation is more perfect than this regex so removing it for now.
	# validates_format_of :phone, :with => /\A[0-9]{10}\Z/
	
  mount_uploader :image, ImageUploader

  mount_uploader :menu, MenuUploader

  belongs_to :owner

  def belong_to?(owner)
  	self.owner.eql?(owner)
  end
end
