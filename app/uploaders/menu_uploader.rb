# encoding: utf-8

class MenuUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    "development/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
      %w(pdf doc docx)
  end

end
