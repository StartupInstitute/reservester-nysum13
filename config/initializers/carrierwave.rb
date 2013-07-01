if Rails.env.test? or Rails.env.cucumber?

# create a connection
connection = Fog::Storage.new({
  :provider                 => 'AWS',
  :aws_access_key_id        => AKIAJZMZ54IGZPNVHMWQ
  :aws_secret_access_key    => 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
})
end