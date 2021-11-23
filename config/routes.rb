Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :collections, only: [:index, :show, :new, :create] do #important, main point of the app
    resources :collection_restaurants, only: [:new, :create] #important
  end

  resources :restaurants, only: [:index, :show, :new, :create] do #important
    resources :notes, only: [:new, :create] #important
  end


  resources :dashboards, only: :index #important for friendship requests
  get '/dashboards/friends', to: 'dashboards#friends'
  get '/dashboards/pending', to: 'dashboards#pending'

  resources :friendships, only: [:new, :create, :destroy] #important outside destroy (should have)
end
