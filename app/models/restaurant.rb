class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone
end
