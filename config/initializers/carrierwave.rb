# CarrierWave initializer
# Configures Fog for Carrierwave so images can be
# stored on AWS S3

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV['AWS_KEY_ID'],                        # required
    :aws_secret_access_key  => ENV['AWS_SECRET_KEY'],                        # required
    :region                 => 'us-east-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'reservester-jay'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
