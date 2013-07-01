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
#  open_time   :time
#  close_time  :time
#  table_qty   :integer
#

class Restaurant < ActiveRecord::Base
  attr_accessible :street, :city, :state, :zip, :description, :name, :phone, :image, :remote_image_url, :menu, :open_time, :close_time, :table_qty, :category_ids, :category_tokens
  attr_reader :category_tokens
  belongs_to :owner
  has_many :reservations
  has_and_belongs_to_many :categories
  
  mount_uploader :image, ImageUploader
  mount_uploader :menu, MenuUploader
  
  validates :name, presence: true
  validates :phone, :numericality => true, :length => {:is => 10}, :allow_blank => true
  validates :owner_id, presence: true
  
  def catgory_tokens=(ids)
    self.category_ids = ids.split(",")
  end
  
  def full?(time_of_day)
    reservations.during(time_of_day).count >= table_qty
  end
  
  def address
    "#{self.street} #{self.city}, #{self.state} #{self.zip}"
  end
  
  def google_map
    street = self.street.gsub(" ", "+") if !self.street.nil?
    city = self.city.gsub(" ", "+") if !self.city.nil?
    "http://maps.googleapis.com/maps/api/staticmap?center=#{street},#{city},#{state}&zoom=13&size=550x400&maptype=roadmap
    &markers=label%7size:small%7Ccolor:blue%7C#{street},#{city},#{state}\&sensor=false"
  end
  
  def format_phone
    if self.phone?
    numbers = self.phone.split('')
    "(#{numbers[0,3].inject(:+)}) #{numbers[3,3].inject(:+)}-#{numbers[6,7].inject(:+)}"
    end
  end
  
  def owned_by?(current_owner)
    owner == current_owner
  end

end
