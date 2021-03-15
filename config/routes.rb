Rails.application.routes.draw do
  devise_for :users

  root to: 'users#show'
  resources :targets, only: :create
  resources :users, only: :show
end
