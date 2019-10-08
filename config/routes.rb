Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "users/signup", to: "users#new"
  post "users/signup", to: "users#signup"
  get "users/signin", to: "users#signin_input"
  post "users/signin", to: "users#signin"
  resources :users, only: %i[show update destroy]
  resources :tweets
end
