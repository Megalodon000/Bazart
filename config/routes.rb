Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :lists, only: [:index, :show, :new, :create, :destroy]
  
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
