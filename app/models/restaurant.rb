class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone

  validates :name, :presence => true
  validates :address, :presence => true
  validates :phone, :presence => true, :length => {:minimum => 10}
end
