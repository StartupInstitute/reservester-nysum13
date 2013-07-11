class Restaurant < ActiveRecord::Base

  attr_accessible :address, :description, :name, :phone, :photo, :photo_cache, :category_ids, :calendar, :max_tables
  acts_as_gmappable
  serialize :calendar

  belongs_to :user
  has_many :reservations
  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates_length_of :phone, is: 10

  mount_uploader :photo, PhotoUploader

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address}" 
  end

  def is_user?(user)
    user.id == user_id
  end



end
