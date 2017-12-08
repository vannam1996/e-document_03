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
  post "/create_report", to:"comments#create"

  resources :users
  resources :friends
  resources :documents do
    resources :comments, only: %i(create destroy)
  end
  resources :history_downloads, only: :create
  resources :categories, only: :create
  resources :history_downloads, only: %i(index create)
  resources :favorites, only: :index
end
