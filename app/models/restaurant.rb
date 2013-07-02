class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image, :remote_image_url
  mount_uploader :image, ImageUploader
  belongs_to :owner
  has_many :reservations, :dependent => :destroy


  validates :name, :presence => true
  validates :owner_id, :presence => true

  # def full?(time_of_day)
  # 	reservations.during(time_of_day).count >= table_count
  # end
end
