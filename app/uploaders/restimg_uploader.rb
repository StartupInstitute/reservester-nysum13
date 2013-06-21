# encoding: utf-8

class RestimgUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick


  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #create different versions
  version :thumb do 
    process :resize_to_limit => [200, 200]
    
  end


end
