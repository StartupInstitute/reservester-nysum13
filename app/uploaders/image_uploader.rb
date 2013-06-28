# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog

  def store_dir
    "development/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


  version :thumb do
     process :resize_to_fill => [300, 250]
  end

  version :masthead do
    process :resize_to_fill => [600, 500]
  end

end
