Reservester::Application.routes.draw do

  root :to => 'page#home'

  resources :restaurants

end
