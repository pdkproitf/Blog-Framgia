Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'password_reset/new'

  get 'password_reset/edit'

  root 'static_pages#home'

  get 'static_pages/about'
  get 'static_pages/help'
  get 'static_pages/contact'

  get 'users/new', to: 'users#new', as: 'sign-up'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :sessions
  resources :account_activations, only: [:edit]
end
