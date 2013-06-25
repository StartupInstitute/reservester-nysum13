CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['AWS_ACCESS_KEY']#{ }"Huge" , #''
    :aws_secret_access_key  => ENV['AWS_SECRET_KEY']#'AKIAJKF3AH2OXQCV3XGA,qmOqwwiJpE3ti8B6EMz1Or0oQs2ffv98350Qxd9N'# #
  }

  config.fog_directory  = 'si.reservester'
end
