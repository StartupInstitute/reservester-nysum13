require 'spec_helper'

describe RestaurantsController do

  describe "GET 'index'" do
    it "renders the :index view" do
      get 'index'
      response.should render_template :index
    end
    it "populates an array of restaurants" do 
      @restaurant = create(:restaurant)
      get :index
      assigns(:restaurants).should eq([@restaurant])
    end
  end

  describe "GET 'show'" do
    it "assigns the requested restaurant to @restaurant" do
      @restaurant = create(:restaurant)
      get :show, id: @restaurant
      assigns(:restaurant).should eq(@restaurant)
    end
    it "renders the :show view" do
      get 'show', id: create(:restaurant)
      response.should render_template :show
    end
  end

  describe "GET 'new'" do
    it "renders the :new view" do
      get 'new'
      response.should render_template :new
    end
  end

  describe "POST 'create'" do
    context "with valid attributes" do
      it "creates a new restaurant" do
        expect{
          post :create, 
            restaurant: attributes_for(:restaurant)
        }.to change(Restaurant, :count).by(1)
      end
      it "redirects to the new restaurant" do
        post :create, 
          restaurant: attributes_for(:restaurant)
        response.should redirect_to Restaurant.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new restaurant" do
        expect{
          post :create,
            restaurant: attributes_for(:invalid_restaurant)
        }.to_not change(Restaurant, :count)
      end
      it "re-renders the :new template" do
        post :create,
          restaurant: attributes_for(:invalid_restaurant)
        response.should render_template :new
      end
    end
  end

  describe "GET 'edit'" do
    it "renders the :edit view" do
      get 'edit', id: create(:restaurant)
      response.should render_template :edit
    end
  end

  describe "PUT 'update'" do
    before :each do
      @restaurant = create(:restaurant)
    end

    it "locates the requested restaurant" do
      put :update, id: @restaurant, 
        restaurant: attributes_for(:restaurant)
      expect(assigns(:message)).to eq(@message)
    end

    context "with valid attributes" do
      it "changes restaurant's attributes" do
        put :update, id: @restaurant,
          restaurant: attributes_for(:restaurant,
           name: "Dairy Diary")
        @restaurant.reload
        expect(@restaurant.name).to eq("Dairy Diary")
      end

      it "redirects to updated restaurant" do
        put :update, id: @restaurant, 
          restaurant: attributes_for(:restaurant)
        expect(response).to redirect_to @restaurant
      end
    end

    context "with invalid attributes" do
      it "does not change restaurant's attributes" do
        put :update, id: @restaurant,
          restaurant: attributes_for(:restaurant,
            name: "No Man's Lamb",
            address: nil)
        @restaurant.reload
        expect(@restaurant.name).to_not eq("No Man's Lamb")
      end

      it "re-renders the edit method" do
        put :update, id: @restaurant,
          restaurant: attributes_for(:invalid_restaurant)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE 'destroy'" do
    before :each do
      @restaurant = create(:restaurant)
    end

    it "deletes the restaurant" do
      expect{
        delete :destroy, id: @restaurant
      }.to change(Restaurant, :count).by(-1)
    end

    it "redirects to the restaurant index" do
      delete :destroy, id: @restaurant
      expect(response).to redirect_to restaurants_url
    end
  end

end
