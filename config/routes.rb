Rails.application.routes.draw do
  devise_for :users

  root to: 'users#show'
  resources :targets, only: [:new, :create, :show, :destroy, :edit, :update]
  resources :users, only: :show
end
