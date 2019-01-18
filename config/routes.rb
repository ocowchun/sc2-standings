Rails.application.routes.draw do
  resources :games
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users, only: [:show]
  get 'standings' => 'home#standings'
  root to: "home#index"
end
