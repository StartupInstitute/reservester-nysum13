class HomeController < ApplicationController
  skip_before_filter :authenticate_owner!
  def index
  	@home
  end
end
