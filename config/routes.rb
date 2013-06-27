Reservester::Application.routes.draw do

  devise_for :users

  match 'dashboard' => 'dashboard#index'

  devise_for :owners

  root :to => 'page#home'

  resources :restaurants do
    resources :reservations
  end

end
