class RestsController < ApplicationController
  before_filter :authenticate_owner!, :except => [:show, :index]

  def index
  	@rests = Rest.all
  end

  def new
  	@rest = current_owner.rests.new
  end

  def create
  	@rest = current_owner.rests.new(params[:rest])

  	if @rest.save
  	redirect_to rests_path
  else
  	  render 'new'
  	end
  end

  def edit
    @rest = Rest.find(params[:id])
    @rest = Rest.find(params[:id])
  end

  def show
  	@rest = Rest.find(params[:id])
  end
  
  def update
    @rest = Rest.find(params[:id])
    if @rest.update_attributes(params[:rest])
      redirect_to rest_path(@rest), :notice => 'Your Restaurant has been successfully updated.'
    else
      redirect_to edit_rest_path(@rest), :notice => 'There was an error updating your restaurant.'
    end
  end

  def destroy
    @rest = Rest.find(params[:id])
    @rest.destroy

    redirect_to rests_path, :notice => 'A restaurant has been deleted.'
  end
end
