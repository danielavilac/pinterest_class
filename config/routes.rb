Rails.application.routes.draw do
  # get '/rout', to: 'controller#action', as: 'alias'
  # get '/users/new', to: 'users#new'
  root 'pins#index'
  get 'register', to: 'users#new'
  get 'login', to: 'sessions#new'
  delete 'logout', to: 'sessions#destroy'
  get 'profile', to: 'users#edit'
  resources :sessions, only: [:create]
  resources :users, only: [:create, :update]
  resources :pins, only: [:index, :new, :create]
end
