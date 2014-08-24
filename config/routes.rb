Rails.application.routes.draw do
  root 'landing#index'

  get :dashboard, to: 'dashboard#index'

  # Resources
  resources :items, only: :create

  # Authentication
  get :signout, to: 'sessions#destroy'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failure'
end
