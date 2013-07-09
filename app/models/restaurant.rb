class Restaurant < ActiveRecord::Base
	
  attr_accessible :address, :description, :name, :phone, :image, :menu

  # Have it only to allow seed data
  attr_accessible :owner_id
  attr_accessible :category_ids

  validates_presence_of :name, :address, :description, :phone, :owner_id
	validates_uniqueness_of :address, :case_sensitive => false
	validates_uniqueness_of :phone
	# Client side phone validation is more perfect than this regex so removing it for now.
	# validates_format_of :phone, :with => /\A[0-9]{10}\Z/
	
  mount_uploader :image, ImageUploader

  mount_uploader :menu, MenuUploader

  belongs_to :owner
  has_many :reservations

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  

 # accepts_nested_attributes_for :categories, 
 #                               allow_destroy: true,
 #                               reject_if: :all_blank
 # accepts_nested_attributes_for :categories_restaurants

  def belong_to?(owner)
  	self.owner.eql?(owner)
  end
end
