Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  root 'top#index'
  resources :users
  resources :spots do
    resources :comments, only: %i[create update destroy]
  end

  resources :spots do
    collection do
      match 'search' => 'spots#index', via: %i[get post]
    end
  end
  resources :stocks,      only: %i[index create destroy]
  resources :likes,       only: %i[index create destroy]
  resources :prefectures, only: %i[index show]
end