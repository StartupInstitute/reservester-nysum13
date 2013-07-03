# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumbnail do
    process :resize_to_fill => [150,75]
  end

  version :masthead do
    process :resize_to_fill => [1366,400]
  end
end
