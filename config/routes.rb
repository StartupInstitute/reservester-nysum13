Reservester::Application.routes.draw do

  resources :categories

  devise_for :users

  match 'dashboard' => 'dashboard#index'

  devise_for :owners

  root :to => 'page#home'

  get 'page/about'

  resources :restaurants do
    resources :reservations
  end

end
