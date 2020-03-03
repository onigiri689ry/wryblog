Rails.application.routes.draw do
  devise_for :users
  root to:'blogs#index'
  resources :blogs do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

  namespace :api do
    resources  controller: :blogs, only: :image_destroy, defaults: { format: 'json' } do
      collection do
        delete "image_destroy"
      end
    end
  end

  resources :tags, only:[:index, :show]
  resources :tagmaps, only:[:index,:show]
  resources :users, only: :show
  resources :images, only: :destroy
end