Rails.application.routes.draw do
  root to:'blogs#index'
  resources :blogs, only:[:index, :new, :create, :show, :edit, :update, :destroy]
end
