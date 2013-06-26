class Rest < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone
  validates :name, presence: true
end
