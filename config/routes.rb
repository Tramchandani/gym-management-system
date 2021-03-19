Rails.application.routes.draw do
  root 'sessions#index'
  get 'sessions/logout', to: 'sessions#logout', as: 'logout'
  get 'sessions/login', to: 'sessions#login', as: 'login'
  post 'sessions/authenticate', to: 'sessions#authenticate', as: 'authenticate'
  resources :users, except: :destroy do
    resources :addresses, shallow: true
  end
  get 'users/edit_password/:id', to: 'users#edit_password', as: 'edit_password'
  post 'users/update_password', to: 'users#update_password', as: 'update_password'
  get 'users/add_image/:id', to: 'users#add_image', as: 'add_image'
  post 'users/upload_image', to: 'users#upload_image', as: 'upload_image'
  get 'users/all_images/:id', to: 'users#all_images', as: 'all_images'
  delete 'users/delete_image/:id', to: 'users#delete_image', as: 'delete_image'
end
