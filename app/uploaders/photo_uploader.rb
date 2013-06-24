# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  version :thumbnail do
    process :resize_to_fill => [300,250]
  end

  version :masthead do
    process :resize_to_fill => [600,500]
  end
end
