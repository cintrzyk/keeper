Rails.application.routes.draw do
  root 'users#index'
  resources :items, only: :create
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: 'sessions#failure'
end
