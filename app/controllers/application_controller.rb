class ApplicationController < ActionController::Base
  # enable devise keywords
  before_filter :authenticate_owner!
  
  protect_from_forgery
end
