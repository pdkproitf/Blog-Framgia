Rails.application.routes.draw do

  root 'static_pages#home'

  get 'static_pages/about'
  get 'static_pages/help'
  get 'static_pages/contact'

  get 'users/new', to: 'users#new', as: 'sign-up'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users do

  end
  resources :sessions
end
