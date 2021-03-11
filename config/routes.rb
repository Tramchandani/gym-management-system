Rails.application.routes.draw do
  root 'sessions#index'
  get 'sessions/logout', to: 'sessions#logout', as: 'logout'
  get 'sessions/login', to: 'sessions#login', as: 'login'
  get 'sessions/authenticate', to: 'sessions#authenticate', as: 'authenticate'
  resources :users, only: [:create, :new, :show]
end
