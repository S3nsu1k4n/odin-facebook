Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  resources :posts, only: [:new, :create]
  resources :friendships
  resources :likes, only: [:create]
  # Defines the root path route ("/")
  root "users#show"
end
