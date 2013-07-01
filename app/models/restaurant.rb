class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :phone

  validates :name, presence: true
  validates :address, presence: true

  # Normalizes the attribute itself before validation
  phony_normalize :phone, :default_country_code => 'US'
  validates :phone, phony_plausible: true, numericality: true
end
