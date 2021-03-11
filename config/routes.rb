Rails.application.routes.draw do
  root 'users#index'
  get 'users/logout', to: 'users#logout'
  get 'users/login', to: 'users#login'
  get 'users/signup', to: 'users#signup'
  get 'users/authenticate', to: 'users#authenticate'
  resources :users
end
