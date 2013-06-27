Reservester::Application.routes.draw do
  resources :reservations


  devise_for :owners

  resources :restaurants
  root :to => 'restaurants#index'
end
