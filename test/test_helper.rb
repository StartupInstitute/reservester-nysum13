ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
end

class ActionController::TestCase
  include Devise::TestHelpers
end

private

def create_and_sign_in_owner
  owner = Owner.create :name => 'John', :email => 'john@restaurant.com', :password => 'foobar123', :password_confirmation => 'foobar123'

  sign_in owner

  owner
end
