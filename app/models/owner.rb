class Owner < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  attr_accessible :name

  validates_presence_of :name
	validates_uniqueness_of :email, :case_sensitive => false

  has_many :restaurants, dependent: :destroy

  def own?(restaurant_id)
    #if self.restaurants.present?
    self.restaurants.find_by_id(restaurant_id).present?
    #end
  end
end
