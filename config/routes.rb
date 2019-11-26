Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :sessions, only: [:index, :show] do
    resources :playlists, only: [:index]
    namespace :my do
      resources :playlists, only: [:new, :create]
    end
  end
  namespace :my do
    resources :playlists, only: [:show, :update]
  end
  resources :playlists, only: [:update]
end
