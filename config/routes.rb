Rails.application.routes.draw do

  root to: "site#index"
  get "/signup", to: "users#new", as: :signup
  get "/profile", to: "users#show", as: :profile

  resources :users, only: [:create]

end