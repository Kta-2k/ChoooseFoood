Rails.application.routes.draw do
  # devise側が定義
  devise_for :users
  
  root 'foods#index'

  resources :foods, only: %i[index show]
  
end
