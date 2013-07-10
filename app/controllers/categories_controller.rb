class CategoriesController < ApplicationController
	
	def index
	  @categories = Category.all
	  respond_to do |format|
	    format.html
      format.json { render :json => @categories.map(&:attributes) }
    end
	end
	
	def show
	 @category = Category.find(params[:id])
	end
	
end
