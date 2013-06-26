class ApplicationController < ActionController::Base
  # enable devise keywords
  before_filter :authenticate_owner!
  
  def  after_sign_in_path_for(owner)
    restaurants_path
  end
  
  def after_sign_out_path_for(owner)
    restaurants_path
  end

  protect_from_forgery
end
