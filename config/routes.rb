Rails.application.routes.draw do
  devise_for :users
  root 'notes#index'
  resources :notes do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:edit, :update, :destroy]
end
