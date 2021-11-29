Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'homepage', to: 'pages#home'

  resources :collections, only: [:index, :show, :new, :create] do #important, main point of the app
    get "/map", to: 'collections#map', as: 'map'
    resources :collection_restaurants, only: [:new, :create] #important
  end

  resources :restaurants, only: [:index, :show, :new, :create] do #important
    resources :notes, only: [:new, :create] #important
  end

  resources :profiles, only: :show

  resources :dashboards, only: :index #important for friendship requests
  get '/dashboards/friends', to: 'dashboards#friends'
  get '/dashboards/pending', to: 'dashboards#pending'

  resources :friendships, only: [:new, :create, :destroy] do #important outside destroy (should have)
    member do
        get '/confirm', to: 'friendships#confirm'
        get '/reject', to: 'friendships#reject'
      end
  end
end
