class Restaurant < ActiveRecord::Base
  attr_accessible :street, :city, :state, :zip, :description, :name, :phone, :image, :remote_image_url, :menu
  mount_uploader :image, ImageUploader
  mount_uploader :menu, ImageUploader
  
  def address
    "#{self.street} #{self.city}, #{self.state} #{self.zip}"
  end
  
  def google_map
    street = self.street.gsub(" ", "+") if !self.street.nil?
    city = self.city.gsub(" ", "+") if !self.city.nil?
    "http://maps.googleapis.com/maps/api/staticmap?center=#{street},#{city},#{state}&zoom=13&size=600x300&maptype=roadmap
    &markers=size:tiny%7Ccolor:blue%7C#{street},#{city},#{state}\&sensor=false"
  end
  
end
