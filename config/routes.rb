Rails.application.routes.draw do
  root 'sessions#index'
  get 'sessions/logout', to: 'sessions#logout', as: 'logout'
  get 'sessions/login', to: 'sessions#login', as: 'login'
  post 'sessions/authenticate', to: 'sessions#authenticate', as: 'authenticate'
  resources :users, except: :destroy
  get 'users/edit_password/:id', to: 'users#edit_password', as: 'edit_password'
  post 'users/update_password', to: 'users#update_password', as: 'update_password'  
end
