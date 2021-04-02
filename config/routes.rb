Rails.application.routes.draw do
  root 'sessions#index'
  get 'sessions/logout', to: 'sessions#logout', as: 'logout'
  get 'sessions/login', to: 'sessions#login', as: 'login'
  post 'sessions/authenticate', to: 'sessions#authenticate', as: 'authenticate'
  resources :users, except: :destroy do
    resources :addresses, except: :show, shallow: true
  end
  get 'users/edit_password/:id', to: 'users#edit_password', as: 'edit_password'
  post 'users/update_password', to: 'users#update_password', as: 'update_password'
  get 'users/:id/add_image', to: 'users#add_image', as: 'add_image'
  post 'users/upload_image', to: 'users#upload_image', as: 'upload_image'
  get 'users/images/:id', to: 'users#all_images', as: 'all_images'
  delete 'users/images/:id', to: 'users#delete_image', as: 'delete_image'
  post 'carts/add_to_cart/:id', to: 'carts#add_to_cart', as: 'add_to_cart'
  get 'carts/:id/cart', to: 'carts#index', as: 'cart'
  delete 'carts/destroy/:id', to: 'carts#destroy', as: 'destroy_exercise_in_cart'
  resources :exercises
  post 'invoices/subscribe', to: 'invoices#subscribe', as: 'subscribe'
  get 'invoices/:id', to: 'invoices#show', as: 'show_invoice'
  get 'invoices/:id/invoice_history', to: 'invoices#index', as: 'invoice_history'
end
