Reservester::Application.routes.draw do

  devise_for :owners

  root :to => 'page#home'

  resources :restaurants

end
