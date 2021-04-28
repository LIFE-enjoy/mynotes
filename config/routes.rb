Rails.application.routes.draw do
  devise_for :users
  root 'notes#index'
  resources :notes do
    resources :comments
  end
  resources :users, only: [:edit, :update, :destroy]
  mount ActionCable.server, at: '/cable'
end
