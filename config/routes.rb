Rails.application.routes.draw do
  root to: "pages#home"

  devise_for :users, controllers: { registrations: "registrations" }

  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :lists, only: [:index, :show, :new, :create, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check
  get "about" => "pages#about", as: :about
  # Defines the root path route ("/")
  # root "posts#index"
end
