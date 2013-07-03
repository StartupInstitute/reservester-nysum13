class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache, :category_ids
  acts_as_gmappable


  belongs_to :owner
  has_many :reservations
  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :name, :presence => true
  validates :address, :presence => true
  validates :description, :presence => true
  validates_length_of :phone, :is => 10

  mount_uploader :photo, PhotoUploader

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address}" 
  end

end
