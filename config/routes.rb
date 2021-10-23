Rails.application.routes.draw do
  get '/new_list', to: 'lists#new'
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  resources :lists
  resources :tasks, only: %i[create destroy]
end
