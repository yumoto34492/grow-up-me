Rails.application.routes.draw do
  devise_for :users

  root to: 'targets#index'
  resources :targets do
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
