Reservester::Application.routes.draw do
  devise_for :owners

  resources :restaurants
  root :to => 'restaurants#index'
end
