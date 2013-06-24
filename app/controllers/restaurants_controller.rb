class RestaurantsController < ApplicationController
    # GET /restaurants
    def index
        @restaurants = Restaurant.all
    end

    #GET /restaurants/:id
    def show
        begin
            @restaurant = Restaurant.find(params[:id])
            render action: "show"
        rescue 
            redirect_to restaurants_url, alert: "Restaurant was not found"
        end
    end

    # GET /restaurants/new
    def new
        authenticate_owner!
        @owner = current_owner
        @restaurant = @owner.restaurants.new
    end

    # GET /restaurants/:id/edit
    def edit
        authenticate_owner!
        @owner = current_owner
        @restaurant = Restaurant.find(params[:id])
        redirect_to "/", alert: "You are not the owner of this restaurant." and return unless @owner == @restaurant.owner
    end

    # POST /restaurants
    def create
        authenticate_owner!
        @owner = current_owner
        @restaurant = @owner.restaurants.create(params[:restaurant])
        if @restaurant.save # save the restaurant and check for success
            redirect_to @restaurant, notice: 'Restaurant was successfully created.'
        else
            render action: "new"
        end
    end

    # PUT /restaurants/:id
    def update
        authenticate_owner!
        @owner = current_owner
        @restaurant = Restaurant.find(params[:id])
        redirect_to "/", alert: "You are not the owner of this restaurant." and return unless @owner == @restaurant.owner
        if @restaurant.update_attributes(params[:restaurant]) # update the restaurant and check for success
            redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
        else
            render action: "edit"
        end
    end

    # DELETE /restaurants/:id
    def destroy
        authenticate_owner!
        @owner = current_owner
        @restaurant = Restaurant.find(params[:id])
        redirect_to "/", alert: "You are not the owner of this restaurant." and return unless @owner == @restaurant.owner
        @restaurant.destroy if @owner == @restaurant.owner
        redirect_to restaurants_url, notice: "Restaurant sucessfully deleted!"
    end
end
