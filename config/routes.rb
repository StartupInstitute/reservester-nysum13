Reservester::Application.routes.draw do
  root :to => 'restaurants#index'

  devise_for :owners
  resources :restaurants do
  	resources :reservations
  end
end
