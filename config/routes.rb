Rails.application.routes.draw do

  root 'static_pages#home'

  get 'about',    to: 'static_pages#about'
  get 'help',     to: 'static_pages#help'
  get 'contact',  to: 'static_pages#contact'

  get 'users/new', to: 'users#new', as: 'sign-up'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :sessions
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
end
