class Category < ActiveRecord::Base
  attr_accessible :description, :name

  #has_and_belongs_to_many :restaurants

  validates :name, presence: true, uniqueness: true

  has_many :categorizations, dependent: :destroy
  has_many :restaurants, through: :categorizations
  

  # accepts_nested_attributes_for :categories_restaurants, allow_destroy: true

end
