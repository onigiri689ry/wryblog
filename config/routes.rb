Rails.application.routes.draw do
  devise_for :users
  root to:'blogs#index'
  resources :blogs do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :tags, only:[:index, :show]
  resources :tagmaps, only:[:index,:show]
  resources :users, only: :show
  resources :image, only: :destroy
end