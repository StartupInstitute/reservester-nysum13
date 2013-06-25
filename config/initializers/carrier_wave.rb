CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAJKF3AH2OXQCV3XGA,qmOqwwiJpE3ti8B6EMz1Or0oQs2ffv98350Qxd9N',
    :aws_secret_access_key  => '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'
  }

  config.fog_directory  = 'si.reservester'
end
