Rails.application.routes.draw do
  root 'users#index'
  resources :items, only: :create
end
