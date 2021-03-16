Rails.application.routes.draw do
  root to: 'home#index'
  get 'sessions/logout', to: 'sessions#logout', as: 'logout'
  get 'sessions/login', to: 'sessions#login', as: 'login'
  post 'sessions/authenticate', to: 'sessions#authenticate', as: 'authenticate'
  resources :users, only: %i[create new show]
end
