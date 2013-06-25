class ApplicationController < ActionController::Base
  before_filter :authenticate_owner!
  protect_from_forgery
end
