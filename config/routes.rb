Rails.application.routes.draw do
  devise_for :users
  root to:'blogs#index'
  resources :blogs do
    resources :comments, only: :create
  end
  resources :tags, only:[:index, :show]
  resources :tagmaps, only:[:index,:show]
  resources :users, only: :show
end