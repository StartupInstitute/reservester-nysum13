class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache, :category_ids

  belongs_to :owner
  has_many :reservations
  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :name, :presence => true
  validates :address, :presence => true
  validates :description, :presence => true
  validates_length_of :phone, :is => 10

  mount_uploader :photo, PhotoUploader

end
