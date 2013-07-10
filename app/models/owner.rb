class Owner < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your models
  attr_accessible :email, :password, :password_confirmation, :remember_me , :name

  validates_uniqueness_of :email

  has_many :restaurants, dependent: :destroy

  has_many :users, :through => :reservations

  def ownership?(restaurant_id)
    self.restaurants.find_by_id(restaurant_id)
  end

end
