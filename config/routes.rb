Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts, only: [:index, :new, :create, :destroy]
  resources :comments, only: [:new, :create, :destroy]
  resources :friendships, only: [:index, :create, :destroy]
  resources :likes, only: [:create, :destroy]
  # Defines the root path route ("/")
  root "users#show"
end 
