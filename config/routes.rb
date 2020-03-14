Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  get 'users/show'
  resources :users, only: [:show]
  resources :spots
end
