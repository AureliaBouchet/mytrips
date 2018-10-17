Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :trips, only: [:index, :show, :new, :create, :update, :destroy, :edit] do
    resources :steps, only: [:new, :create]
  end
  resources :steps, only:[:index, :destroy, :edit, :update] do
    resources :restaurants, only: [:new, :create]
    resources :bars, only: [:new, :create]
    resources :hotels, only: [:new, :create]
    resources :activities, only: [:new, :create]
  end
  resources :users, only: [:show, :update, :edit]
  resources :restaurants, only: [:update, :destroy, :edit]
  resources :bars, only: [:update, :destroy, :edit]
  resources :activities, only: [:update, :destroy, :edit]
  resources :hotels, only: [:update, :destroy, :edit]


end
