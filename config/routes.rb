Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "users/sign_up", to: "users#new"
  post "users/sign_in", to: "users#sign_in"
end
