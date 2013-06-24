Reservester::Application.routes.draw do 
  get "home/index"

  root :to => 'home#index'
  resources :restaurants
  # needed for devise to work
  devise_for :owners do
    get "/owners/sign_out", to: "devise/sessions#destroy"
  end
 
  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
