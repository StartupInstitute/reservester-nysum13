Reservester::Application.routes.draw do

  devise_for :owners do
    get "/owners/sign_out", to: "devise/sessions#destroy"
  end

  get "pages/index"
  
  resources :restaurants do
    resources :reservations
  end
  
  root to: "pages#index"
 
end
