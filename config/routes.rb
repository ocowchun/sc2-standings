Rails.application.routes.draw do
  resources :games
  devise_for :users, controllers: {
    sessions: 'users/sessions'

  }

  root to: "home#index"
end
