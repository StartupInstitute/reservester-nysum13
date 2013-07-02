CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV['ACCESS_KEY_ID'],
    :aws_secret_access_key  => ENV['SECRET_ACCESS_KEY'],
    :region									=> 'us-east-1'
  }

  config.fog_directory  = 'reservester'
  config.fog_public			= true
end
