Rails.application.routes.draw do
  root to: "site#index"
  get "/profile", to: "users#show", as: :profile
  resources :users, only: [:new, :create]
end