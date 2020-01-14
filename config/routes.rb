Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in",   to: "users/sessions#new"
    get "sign_out",  to: "users/sessions#destroy"
    # get 'login',     to: 'devise/sessions#new'
    # post 'login',    to: 'devise/sessions#create'
    # delete 'signout',to: 'devise/sessions#destroy'
  end

  root 'top#index'
  resources :users
  resources :spots do
    resources :comments, only: %i[create update destroy]
  end

  resources :spots do
    collection do
      match 'search' => 'spots#index', via: [:get, :post]
    end
  end
  resources :stocks,      only: %i(index create destroy)
  resources :likes,       only: %i(index create destroy)
  resources :prefectures, only: %i(index show)
end