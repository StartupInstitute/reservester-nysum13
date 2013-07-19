Reservester::Application.routes.draw do

  root :to => 'restaurants#index'

  devise_for :owners
  resources :categories
  resources :restaurants do
  	resources :reservations
  end

  # Owner specific pages
  match '/dashboard', :to => 'owners#dashboard'
end
