Reservester::Application.routes.draw do
  resources :reservations

  devise_for :owners

  get '/dashboard' => 'owners#dashboard', :as => :dashboard

  resources :owners do
    resources :restaurants, :only => [:new, :create]
  end

  resources :restaurants, :except => [:new, :create] do
    resources :reservations, :only => [:new, :create]
  end

  resources :reservations, :except => [:new, :create]

  root :to => 'restaurants#index'
end
