Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  root to: "pages#home"

  devise_for :users

  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :lists, only: [:index, :show, :new, :create, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check
  get "about" => "pages#about", as: :about
  # Defines the root path route ("/")
  # root "posts#index"

  resources :users, only: [:index, :show]
end