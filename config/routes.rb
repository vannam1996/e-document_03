Rails.application.routes.draw do
  root "static_page#home"
  post "/signup", to: "users#create"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  delete "/unfriend", to: "friends#destroy"
  post "/search_name_document", to: "search_documents#search_name"
  post "/search_categories", to: "search_documents#search_category"

  resources :users
  resources :friends
  resources :documents
  resources :history_downloads, only: :create
  resources :categories, only: :create
end
