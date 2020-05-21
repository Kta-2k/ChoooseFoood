Rails.application.routes.draw do
  # devise側が定義
  devise_for :users
  
  root 'foods#index'

  resources :foods, only: %i[index show]

  resources :histories, only: %i[create destroy]

  resources :users, only: %i[show]
  
  resources :nostalgia, only: %i[index]
end
