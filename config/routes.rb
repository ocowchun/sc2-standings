Rails.application.routes.draw do
  resources :games
  resources :users, only: [:show]
  devise_for :users, controllers: {
    sessions: 'users/sessions'

  }

  root to: "home#index"
end
