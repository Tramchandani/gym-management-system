Rails.application.routes.draw do
  devise_for :users
  root 'exercises#index'
  resources :users, only: :show do
    resources :addresses, except: :show, shallow: true
  end
  get 'users/:id/add_image', to: 'users#add_image', as: 'add_image'
  post 'users/upload_image', to: 'users#upload_image', as: 'upload_image'
  get 'users/images/:id', to: 'users#all_images', as: 'all_images'
  delete 'users/images/:id', to: 'users#delete_image', as: 'delete_image'
  resources :exercises
end
