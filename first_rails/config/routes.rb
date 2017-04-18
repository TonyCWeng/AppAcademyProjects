Rails.application.routes.draw do
  # resources :users
  get 'users', to: 'users#index', as: 'users'
  get 'users/:id', to: 'users#show'
  post 'users', to: 'users#create', as: 'create_user'
  patch 'users/:id', to: 'users#update'
  put 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'
  get 'users/new', to: 'users#new', as: 'new_user'
  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'

  resources :users, only: [:create, :destroy, :index, :show, :update]

  get 'artworks', to: 'artworks#index', as: 'artworks'
  get 'artworks/:id', to: 'artworks#show'
  post 'artworks', to: 'artworks#create', as: 'create_artwork'
  patch 'artworks/:id', to: 'artworks#update'
  put 'artworks/:id', to:


end
