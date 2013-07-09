# == Schema Information
#
# Table name: restaurants
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  street      :string(255)
#  phone       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string(255)
#  menu        :string(255)
#  city        :string(255)
#  state       :string(255)
#  zip         :string(255)
#  owner_id    :integer
#  open_time   :integer
#  close_time  :integer
#  table_qty   :integer
#

class Restaurant < ActiveRecord::Base
  attr_accessible :street, :city, :state, :zip, :description, :name, :phone, :image, :remote_image_url, :menu, :open_time, :close_time, :table_qty, :category_ids, :category_tokens
  attr_reader :category_tokens
  belongs_to :owner
  has_many :reservations
  has_many :categorizations
  has_many :categories, :through => :categorizations
  has_many :users, :through => :reservations
  
  mount_uploader :image, ImageUploader
  mount_uploader :menu, MenuUploader
  
  validates :name, presence: true
  validates :phone, :numericality => true, :length => {:is => 10}, :allow_blank => true
  validates :owner_id, presence: true
  
  # RESERVATIONS_PER_HOUR = 3
  
  def catgory_tokens=(ids)
    self.category_ids = ids.split(",")
  end
  
  # def full?(time_of_day)
  #   reservations.during(time_of_day).count >= table_qty
  # end
  
  def address
    "#{self.street} #{self.city}, #{self.state} #{self.zip}"
  end
  
  def google_map
    street = self.street.gsub(" ", "+") if self.street.present?
    city = self.city.gsub(" ", "+") if self.city.present?
    "http://maps.googleapis.com/maps/api/staticmap?center=#{street},#{city},#{state}&zoom=13&size=550x400&maptype=roadmap&markers=label%7size:small%7Ccolor:blue%7C#{street},#{city},#{state}\&sensor=false"
  end
  
  def format_phone
    if self.phone?
    numbers = self.phone.split('')
    "(#{numbers[0]}#{numbers[1]}#{numbers[2]}) #{numbers[3]}#{numbers[4]}#{numbers[5]}-#{numbers[6]}#{numbers[7]}#{numbers[8]}#{numbers[9]}"
    end
  end
  
  def owned_by?(current_owner)
    owner == current_owner
  end

end
