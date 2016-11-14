Rails.application.routes.draw do

  root 'static_pages#home'

  get 'static_pages/about'
  get 'static_pages/help'
  get 'static_pages/contact'

  get 'users/new', to: 'users#new', as: 'sign-up'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :sessions
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
end
