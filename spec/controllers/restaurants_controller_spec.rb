require 'spec_helper'

describe RestaurantsController do
  describe 'GET #index' do
    it "populates an array of restaurants" do
      restaurant = create(:restaurant)
      get :index
      expect(assigns(:restaurants)).to match_array [restaurant]
    end
    
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe 'GET #show' do
    it "assigns the requested restaurant to @restaurant" do
      restaurant = create(:restaurant)
      get :show, id: restaurant
      expect(assigns(:restaurant)).to eq(restaurant)
    end
    
    it "renders the :show template" do
      restaurant = create(:restaurant)
      get :show, id: restaurant
      expect(response).to render_template :show
    end
  end
  
  describe 'GET #new' do
    before do
      owner = create(:owner)
      sign_in owner
    end
    it "assigns a new Restaurant to @restaurant" do
      get :new
      expect(assigns(:restaurant)).to be_a_new(Restaurant)
    end
    
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
  
  describe 'GET #edit' do
    before do
      owner = create(:owner)
      sign_in owner
      @restaurant = create(:restaurant, owner_id: owner.id)
    end
    
    it "assigns the requested restaurant to @restaurant" do
      get :edit, id: @restaurant
      expect(assigns(:restaurant)).to eq(@restaurant)
    end
    
    it "renders the :edit template" do
      get :edit, id: @restaurant
      expect(response).to render_template :edit
    end
  end
  
  describe "POST #create" do
    before do
      owner = create(:owner)
      sign_in owner
    end
    context "with valid attributes" do
      it "saves the new restaurant in the database" do
        expect{
          post :create, restaurant: attributes_for(:restaurant)
        }.to change(Restaurant, :count).by(1)
      end
      
      it "redirects to the restaurants index page" do
        post :create, restaurant: attributes_for(:restaurant)
        expect(response).to redirect_to restaurants_path
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new restaurant in the database" do
        expect{
          post :create,
            restaurant: attributes_for(:invalid_message)
        }.to_not change(Restaurant, :count)
      end
      
      it "re-renders the :new template" do
        post :create,
          restaurant: attributes_for(:invalid_message)
          expect(response).to render_template :new
      end
    end
  end
  
  describe 'PUT #update' do
    context "with valid attributes" do
      it "updates the restaurant in the database"
      it "redirects to the restaurant"
    end
    
    context "with invalid attributes" do
      it "does not update the restaurant"
      it "re-renders the #edit template"
    end
  end
  
  describe 'DELETE #destroy' do
    it "deletes the message from the database"
    it "redirects to the restaurant index page"
  end
end