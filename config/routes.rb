Rails.application.routes.draw do
  devise_for :users

  root to: 'users#show'
  resources :targets, only: [:new, :create]
  resources :users, only: :show
end
