ActionController::Routing::Routes.draw do |map|
  map.resources :bids

  map.resources :add_address_to_users

  map.resources :auctions


  map.connect '', :controller => "main", :action => "welcome"
  map.connect "/users/login", :controller => "users", :action => "login"
  map.connect "/users/logout", :controller => "users", :action => "logout"
  map.connect "/users/edit/:id", :controller => "users", :action => "update"
  map.connect "/admins/admin_show", :controller=>"admins", :action=>"admin_show"
  map.connect "/admins/message_show", :controller=>"admins", :action=>"showmessages"
  map.connect "/admins/logout", :controller=>"admins", :action=>"logout"
  map.connect "users/personalInfo/:id", :controller=> "users", :action=>"personalInfo"
  map.connect "messages/show/:id", :controller=>  "messages", :action=>"show"
map.connect "/admins/activeall", :controller=>  "admins", :action=>"activeall"
map.connect "/admins/deactiveall", :controller=>  "admins", :action=>"deactiveall"
map.connect "/users/forgot_password",  :controller=>  "users", :action=>"forgot_password"
map.connect "/users/change_password",  :controller=>  "users", :action=>"change_password"
  map.resources :admins
  map.resources :users
  map.resources :auctions

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
