CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => Figaro.env.provider,
    :aws_access_key_id      => Figaro.env.aws_access_key_id,
    :aws_secret_access_key  => Figaro.env.aws_secret_access_key,
  }
  config.fog_directory  = 'reservester-docs'
end
