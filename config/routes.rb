Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "users/signup", to: "users#new"
  post "users/signup", to: "users#sign_up"
  resources :tweets
end
