Reservester::Application.routes.draw do
  resources :categories


  root :to => 'restaurants#index'

  devise_for :owners
  resources :restaurants do
  	resources :reservations
  end

  # Owner specific pages
  get '/dashboard', :to => 'restaurants#dashboard'
end
