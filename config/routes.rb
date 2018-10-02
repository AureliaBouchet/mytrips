Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :trips, only: [:index, :show, :create]
  resources :users, only: [:show, :update, :edit]

end
