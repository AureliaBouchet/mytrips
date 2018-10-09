Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :trips, only: [:index, :show, :new, :create] do
    resources :steps, only: [:create, :new]
  end
  resources :users, only: [:show, :update, :edit]

end
