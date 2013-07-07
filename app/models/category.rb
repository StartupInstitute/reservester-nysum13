class Category < ActiveRecord::Base
  attr_accessible :description, :name

  #has_and_belongs_to_many :restaurants

  validates :name, presence: true, uniqueness: true

  has_many :restaurants, through: :categories_restaurants
  has_many :categories_restaurants

end
