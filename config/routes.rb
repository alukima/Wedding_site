RsvpOnline::Application.routes.draw do
  root 'weddings#home'

  #wedding
  match '/',        to: 'weddings#home',    via: 'get'
  match '/venue',   to: 'weddings#venue',   via: 'get'
  match '/events',  to: 'weddings#events',  via: 'get'
  match '/rsvp',    to: 'weddings#rsvp',    via: 'get'
  match '/photos',  to: 'weddings#photos',  via: 'get'

  #admin
  match '/admin',        to: 'admin#settings',     via: 'get'
  match '/verify_admin', to: 'admin#verify_admin', via: 'post'
  match '/sign_in',      to: 'session#sign_in',    via: 'get'
  match '/sign_out',     to: 'session#sign_out',   via: 'get'

  #campaigns
  match '/gift/send',                to: 'campaigns#show',                                        via: 'get'
  match '/gift/payment/:id',         to: 'campaigns#process_payment',   as: '/gift/payment',      via: 'get'
  match '/gift/confirmation/:id',    to: 'campaigns#gift_confirmation', as: '/gift/confirmation', via: 'get'
  match '/campaign/find_user',       to: 'campaigns#user',                                        via: 'get'

  #guests
  resources :users
  resources :weddings
  resources :campaigns
  resources :payments
  resources :session, :only => [:create, :destroy]

 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
