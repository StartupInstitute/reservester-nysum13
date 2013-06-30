CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV["ACCESS_KEY_ID"],
    :aws_secret_access_key  => ENV["SECRET_ACCESS_KEY"]
  }

  config.fog_directory  = 'si.reservester'
end
