Rails.application.routes.draw do

  resources :users, except: [:update, :edit]
  resource :sessions, only: [:new, :create, :destroy]
end
