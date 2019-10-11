Rails.application.routes.draw do
  root to: 'tweets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: %i[show edit update destroy] do
    collection do
      get :signup, to: "users#new"
      post :signup
      get :signin, to: "users#signin_input"
      post :signin
      delete :signout
    end
  end
  resources :tweets do
    collection do
      post "create_retweet"
    end
  end
  resources :relationships, only: %i[create destroy]
end
