class RestaurantsController < ApplicationController
    # GET /restaurants
    def index
        @restaurants = Restaurant.all
    end

    #GET /restaurants/:id
    def show
        @restaurant = Restaurant.find(params[:id])
    end

    # GET /restaurants/new
    def new
        @restaurant = Restaurant.new
    end

    # GET /restaurants/:id/edit
    def edit
        @restaurant = Restaurant.find(paramd[:id])
    end

    # POST /restaurants
    def create
        @restaurant = Restaurant.new(params[:restaurant])
        if @restaurant.save # save the restaurant and check for success
            redirect_to @restaurant, notice: 'Restaurant was successfully created.'
        else
            render action: "new"
        end
    end

    # PUT /restaurants/:id
    def update
        @restaurant = Restaurant.find(params[:id])
        if @restaurant.update_attributes(params[:restaurant]) # update the restaurant and check for success
            redirect_to @restaurant, notice: 'Restaurant was successfully updated.'
        else
            render action: "edit"
        end
    end

    # DELETE /restaurants/:id
    def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
    end
end
