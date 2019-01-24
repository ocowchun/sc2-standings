Rails.application.routes.draw do
  resources :games
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :users, only: [:show]
  get 'standings' => 'home#standings'

  resources :series, only: [:show] do
    resources :game_sets, path: "game-sets", only: [:new, :create]
  end

  root to: "home#index"
end
