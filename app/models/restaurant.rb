class Restaurant < ActiveRecord::Base
  attr_accessible :address, :description, :name, :image, :pdf
  mount_uploader :image, ImageUploader
  mount_uploader :pdf, PdfUploader
  belongs_to :owner


end
