Rails.application.routes.draw do
  root to: 'tweets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "users/signup", to: "users#new"
  post "users/signup", to: "users#signup"
  get "users/signin", to: "users#signin_input"
  post "users/signin", to: "users#signin"
  delete "users/signout", to: "users#signout"
  resources :users, only: %i[show edit update destroy]
  resources :tweets
end
