# encoding: utf-8

class RestimgUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick


  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
# S3 configuration
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => aws_token,                        # required
    :aws_secret_access_key  => aws_secret_token,                        # required
  }
  config.fog_directory  = 'reservester-jay'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end

  #create different versions
  version :thumb do 
    process :resize_to_limit => [300, 250]
    
  end

  version :masthead do
    process :resize_to_limit => [600, 500]
  end

end
