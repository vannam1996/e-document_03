Rails.application.routes.draw do
  root "static_page#home"
  post "/signup", to: "users#create"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  delete "/unfriend", to: "friends#destroy"

  resources :users
  resources :friends
  resources :documents
end
