class Restaurant < ActiveRecord::Base
    attr_accessible :name, :description, :address, :phone
    validates :name, :presence => true
    validates :description, :presence => true
    validates :address, :presence => true
    validates :phone, :presence => true, :length => {:minimum => 10}
end
