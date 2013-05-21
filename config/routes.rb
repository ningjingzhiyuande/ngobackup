Itbackup::Application.routes.draw do



  devise_for :users, :controllers => { :omniauth_callbacks => :omniauth_callbacks }, :skip => [:registrations, :confirmations, :sessions, :passwords]


  namespace :admin do
    resources :posts,:only=>[:index,:destroy]
    resources :home_pics
    resources :blogs,:only=>[:index,:create]
    resources :ngos
    resources :cases do
      member do
        get :images
        post :attach_images
      end
    end
    resources :assets
    root :to=>"ngos#index"
  end


  resources "home",:controller=>"home",:only=>[:index]
  resources "ngo",:controller =>"ngo",:only=>[:index]
  resources "blogs",:only=>[:index,:show,:new,:create]
  resources "about",:controller =>"about",:only=>[:index]
  resources "cases",:only=>[:index]
  resources "contacts",:only=>[:index,:create]
  resources "supports",:only=>[:index]
  root :to=> "home#index"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
 
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
