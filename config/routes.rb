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

       post 'operators/:id/retired', to: 'operators#retired', as: 'retired_operator'
       post 'operators/:id/reinstated', to: 'operators#reinstated', as: 'reinstated_operator'
       post 'operators/:id/enable', to: 'operators#enable', as: 'enable_operator'
       get 'operators/:id/retire', to: 'operators#retire', as: 'retire_operator'
       get 'operators/:id/reinstate', to: 'operators#reinstate', as: 'reinstate_operator'
       get 'operators/:id/activate', to: 'operators#activate', as: 'activate_operator'
       get 'operators/savehistory'
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
       resources :supervisors

       resources :labors

       resources :costcs

       resources :sublots

     end
end
