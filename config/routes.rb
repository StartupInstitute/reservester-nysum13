Reservester::Application.routes.draw do
  resources :reservations


  devise_for :owners

  resources :owners do
    resources :restaurants, :only => [:new, :create]
  end

  resources :restaurants, :except => [:new, :create]

  root :to => 'restaurants#index'
end
