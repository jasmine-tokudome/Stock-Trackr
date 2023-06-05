Rails.application.routes.draw do
  get 'sales/new'
  get 'sale/new'
  get 'saless/new'
  root "static_pages#home"
  get 'password_resets/new'
  get 'password_resets/edit'
  get  "/help",    to: "static_pages#help"
  get  "/about",   to: "static_pages#about"
  get  "/contact", to: "static_pages#contact"
  get  "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  get '/products/edit', to: 'products#edit'
  put '/products/edit', to: 'products#update_stocks'
  get '/sales/new', to: 'sales#new'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
end