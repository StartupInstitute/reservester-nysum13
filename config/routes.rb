Reservester::Application.routes.draw do

  devise_for :users

  devise_for :owners do
    get "/owners/sign_out", to: "devise/sessions#destroy"
  end
  
  get "dashboard/show"
  
  resources :restaurants do
    resources :reservations
  end
  
  resources :categories, only: [:index]
  
  get "pages/index"
  
  root to: "pages#index"
 
end
