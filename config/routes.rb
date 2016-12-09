Rails.application.routes.draw do
  devise_for :users
  resources :sublots
  resources :costcs
  resources :labors
  resources :supervisors
  resources :jobs
  resources :operators
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

devise_scope :user do
  authenticated :user do
    root 'plainpage#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end

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
     namespace :admin do

       post 'operators/retired/:id', to: 'operators#retired', as: 'retired_operator'
       post 'operators/reinstated/:id', to: 'operators#reinstated', as: 'reinstated_operator'
       post 'operators/enable/:id', to: 'operators#enable', as: 'enable_operator'
       post 'operators/changedjob/:id', to: 'operators#changedjob', as: 'changedjob_operator'
       get 'operators/retire/:id', to: 'operators#retire', as: 'retire_operator'
       get 'operators/reinstate/:id', to: 'operators#reinstate', as: 'reinstate_operator'
       get 'operators/activate/:id', to: 'operators#activate', as: 'activate_operator'
       get 'operators/changejob/:id', to: 'operators#changejob', as: 'changejob_operator'
       get 'operators/savehistory'
       get 'operators/paysheet/:fromdate/:todate/:paydate/:companytype', to: 'operators#paysheet', as: 'operators_paysheet'
       post 'operators/paysheet_post', to: 'operators#paysheet_post', as: 'paysheet_post'
       resources :operators

       resources :jobs
       get 'jobs/disable/:id', to: 'jobs#disable', as: 'disable_job'
       get 'jobs/enable/:id', to: 'jobs#enable', as: 'enable_job'

       post 'supervisors/:id/retired', to: 'supervisors#retired', as: 'retired_supervisor'
       post 'supervisors/:id/reinstated', to: 'supervisors#reinstated', as: 'reinstated_supervisor'
       post 'supervisors/:id/enable', to: 'supervisors#enable', as: 'enable_supervisor'
       get 'supervisors/:id/retire', to: 'supervisors#retire', as: 'retire_supervisor'
       get 'supervisors/:id/reinstate', to: 'supervisors#reinstate', as: 'reinstate_supervisor'
       get 'supervisors/:id/activate', to: 'supervisors#activate', as: 'activate_supervisor'
       get 'supervisors/register', to: 'supervisors#register', as: 'register_supervisor'


       get 'transcriptions/get_labors/:operatorId', to: 'transcriptions#get_labors', as: 'get_labors'
       get 'transcriptions/get_sublots/:costcId', to: 'transcriptions#get_sublots', as: 'get_sublots'


       get 'novelties/get_employeelabors/:supervisorId', to: 'novelties#get_employeelabors', as: 'get_employeelabors'

       get 'configs/index', to: 'configs#index', as: 'index_config'
       get 'configs/edit', to: 'configs#edit', as: 'edit_config'
       patch 'configs/update', to: 'configs#update', as: 'update_config'

       get 'registers/index', to: 'registers#index', as: 'index_register'
       post 'registers/create', to: 'registers#create', as: 'create_register'
       get 'registers/new', to: 'registers#new', as: 'new_register'
       get 'registers/edit/:id', to: 'registers#edit', as: 'edit_register'
       patch 'registers/update/:id', to: 'registers#update', as: 'update_register'

       resources :supervisors

       resources :labors

       resources :costcs

       resources :sublots

       resources :transcriptions
       
       resources :novelties

       resources :billingcs

       resources :companies

     end
end
