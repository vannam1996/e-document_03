Rails.application.routes.draw do
  root "static_page#home"
  post "/signup", to: "users#create"
  get "/signup", to: "users#new"

  resources :users
end
