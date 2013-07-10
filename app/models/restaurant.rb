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
  
  def category_tokens=(ids)
    self.category_ids = ids.split(",")
  end
  
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
  
  def format_time(time)
    case time
    when 1
      "1 AM"
    when 2
      "2 AM"
    when 3
      "3 AM"
    when 4
      "4 AM"
    when 5
      "5 AM"
    when 6
      "6 AM"
    when 7
      "7 AM"
    when 8
      "8 AM"
    when 9
      "9 AM"
    when 10
      "10 AM"
    when 11
      "11 AM"
    when 12
      "12 PM"
    when 13
      "1 PM"
    when 14
      "2 PM"
    when 15
      "3 PM"
    when 16
      "4 PM"
    when 17
      "5 PM"
    when 18
      "6 PM"
    when 19
      "7 PM"
    when 20
      "8 PM"
    when 21
      "9 PM"
    when 22
      "10 PM"
    when 23
      "11 PM"
    when 24
      "12 AM"
    end
  end
  
  def owned_by?(current_owner)
    owner == current_owner
  end

end
