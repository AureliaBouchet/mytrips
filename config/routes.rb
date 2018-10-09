Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :trips, only: [:index, :show, :new, :create, :update, :destroy, :edit] do
    resources :steps, only: [:new, :create]
  end
  resources :steps, only:[:destroy, :edit, :update]
  resources :users, only: [:show, :update, :edit]

end
