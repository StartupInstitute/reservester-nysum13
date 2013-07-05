class Rest < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone, :image 
  validates :name, :owner_id, presence: true
  mount_uploader :image, AvatarUploader
  belongs_to :owner
end
