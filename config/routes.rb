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
    resources :playlists, only: [:show, :update, :destroy]
  end
  resources :playlists, only: [:update]
  devise_scope :user do
    root to: 'static_pages#home'
    match '/sessions/user', to: 'devise/sessions#create', via: :post
  end
end
