Rails.application.routes.draw do
  devise_for :users
  root to:'blogs#index'
  resources :blogs, only:[:index, :new, :create, :show, :edit, :update, :destroy]
  resources :tags, only:[:index, :show]
  resources :tagmaps, only:[:index,:show]
  resources :users, only: :show
end