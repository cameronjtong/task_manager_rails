Rails.application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"
  get "/new_list", to: "lists#new"
  root "static_pages#home"
  get "/home", to: "static_pages#home"
  resources :lists
  resources :users
  resources :tasks, only: %i[create destroy]
  resources :password_resets, only: %i[new create edit update]
end
