Rails.application.routes.draw do
  devise_for :users
  root 'notes#index'
  resources :notes do
    resources :comments, only: [:index, :create]
  end
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :notifications, only: [:index, :destroy] do
    collection do
      get :destroy_all
    end
  end
  mount ActionCable.server, at: '/cable'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
end
