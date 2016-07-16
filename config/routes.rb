UYPort::Application.routes.draw do
  get "welcome/index"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  match '/welcome/:action' => 'welcome#:action'
  
 
 # ----  RUTAS  PARA  CONSULTAS  AJAX  ----
 
 #  tipos de vehiculos
 get 'vehicle_types/couplable_types_by_id', to: 'vehicle_types#couplable_types_by_id'
 post 'vehicle_types/couplable_types_by_id', to: 'vehicle_types#couplable_types_by_id'
 
 #  cuentas por cliente
 get 'accounts/accounts_by_customer_id', to: 'accounts#accounts_by_customer_id'
 post 'accounts/accounts_by_customer_id', to: 'accounts#accounts_by_customer_id'
 
 # Autocomplete clientes
get 'customers/customers_ac', to: 'customers#customers_ac' 

 # Autocomplete tipos pedido
get 'm_shipping_requests/m_shipping_requests_ac', to: 'm_shipping_requests#m_shipping_requests_ac'
 # Completar datos de un pedido a partir del modelo de pedido
post 'm_shipping_requests/fill_request_order_line', to: 'm_shipping_requests#fill_request_order_line' 
 
 
 # Documentos de un viaje clientes
get 'shipments/list_documents', to: 'shipments#list_documents' 
 
 # Tipos de trabajo por cliente , para campo options
 post 'm_shipping_requests/options_by_customer_id(.:format)', to: 'm_shipping_requests#options_by_customer_id'
 get  'm_shipping_requests/options_by_customer_id(.:format)/:id', to: 'm_shipping_requests#options_by_customer_id'
 
 
 # ----  FIN RUTAS  PARA  CONSULTAS  AJAX  ---- 
  
  
 # Paginas agregadas
 
 get 'shipments/pending(.:format)', to: 'shipments#pending'  
 get 'shipments/completed(.:format)', to: 'shipments#completed'  
 get 'shipments/bill_pending(.:format)', to: 'shipments#bill_pending'  
 get 'shipments/by_date(.:format)', to: 'shipments#by_date'  
    
 get 'shipments/new/:id(.:format)', to: 'shipments#new' 
 get 'shipments/consultar_moviles(.:format)', to: 'shipments#consultar_moviles'  
 get 'shipments/consultar_ultima_posicion(.:format)', to: 'shipments#consultar_ultima_posicion' 
  
 post 'shipments/:id/ajax_update(.:format)', to: 'shipments#ajax_update'   
  
  
 get 'shipping_requests_builder/start(.:format)', to: 'shipping_requests_builder#start'   
 post 'shipping_requests_builder/start(.:format)', to: 'shipping_requests_builder#fill_data'  
 post 'shipping_requests_builder/fill_data(.:format)', to: 'shipping_requests_builder#create_from_template'  
  
 get 'daily_shipping_requests/list(.:format)', to: 'daily_shipping_requests#list'  
 post 'daily_shipping_requests/list(.:format)', to: 'daily_shipping_requests#list'   
 
 
 get 'customer_shipping_orders/pending_requests', to: 'customer_shipping_orders#pending_requests' 
 get 'customer_shipping_orders/completed_requests', to: 'customer_shipping_orders#completed_requests'
 
 get 'vehicles/update_positions', to: 'vehicles#update_positions'
 
 get 'vehicles/save_odometer_readings', to: 'vehicles#save_odometer_readings'
 
 get 'vehicles/top_kilometers_done', to: 'vehicles#top_kilometers_done'   
 get 'vehicles/vehicle_odometer_readings', to: 'vehicles#vehicle_odometer_readings'   
 get 'vehicles/update_vehicles_gps_data', to: 'vehicles#update_vehicles_gps_data'   
 get 'vehicles/update_from_gps_data/:gps_vehicle_id', to: 'vehicles#update_gps_data'  
 get 'vehicles/create_from_gps_data/:gps_vehicle_id', to: 'vehicles#create_from_gps_data'  
  
  # Sample resource route (maps HTTP verbs to controller actions automatically):   
  
  # ----  RECURSOS  ----
  
  resources :accounts
  resources :billing_units
  
  resources :cargo_types
  resources :cargo_categories
  
  resources :companies   
  
  resources :customers, shallow: true do 
	 resources :addresses
  end
  
  resources :document_types
  resources :employees  
  resources :locations 
  resources :measure_units
  
  resources :shipments  do
    resources :shipment_supplies
    resources :shipment_deliveries
    resources :shipment_documents
  end
  
  resources :customer_shipping_orders, shallow: true do
    resources :shipping_requests
  end
  
  
  # pedidos modelo
  resources :m_shipping_requests, shallow: true do
	resources :m_requested_cargos, shallow: true do
		resources :m_requested_deliveries		
		resources :m_requested_supplies
	end	
  end
 
  resources :services
  resources :states 
  
  resources :vehicles, shallow: true do
	 resources :sucta_registrations
	resources :vehicle_registrations
  end
	
  resources :trips
  
  resources :vehicle_brands
  resources :vehicle_types  
  
  
 # Requests particulares
 
 get 'customer_shipping_orders/:id/:sel_line_id', to: 'customer_shipping_orders#show'

  
  #  Autenticacion y Manejo de usuarios
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  
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
  
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
