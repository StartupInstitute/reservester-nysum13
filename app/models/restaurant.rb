class Restaurant < ActiveRecord::Base

  acts_as_gmappable

  attr_accessible :description, :street, :city, :state, :longitude, :latitude, :name, :phone, :image, :remote_image_url, :menu, :owner_id


  mount_uploader :image, ImageUploader
  mount_uploader :menu, MenuUploader

  belongs_to :owner
  has_many :reservations

  validates :name, :presence => true, :uniqueness => true

  def gmaps4rails_address
    "#{street}, #{city}, #{state}"
  end


end
