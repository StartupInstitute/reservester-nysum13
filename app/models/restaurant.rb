class Restaurant < ActiveRecord::Base

  acts_as_gmappable

  attr_accessible :description, :street, :city, :state, :longitude, :latitude, :name, :phone, :image, :remote_image_url, :menu , :owner_id, :category_ids #, :category_tokens

  #attr_reader :category_tokens
  #
  #def category_tokens=(ids)
  #  self.category_ids = ids.split(",")
  #end
  # accepts_nested_attributes_for :categorizations
  #attr_accessible :categorizations_attributes

  mount_uploader :image, ImageUploader
  mount_uploader :menu, MenuUploader

  belongs_to :owner
  has_many :reservations
  has_many :categorizations
  has_many :categories , through: :categorizations

  validates :name, :presence => true, :uniqueness => true

  def gmaps4rails_address
    "#{street}, #{city}, #{state}"
  end

  def self.text_search(query)
    if query.present?
      where('name @@ :q or description @@ :q', q: query)
    else
      scoped
    end
  end
end
