Rails.application.routes.draw do
  
  devise_for :users
  root "food#index"

  resources :food
  
  # get 'pages/index'
  # get 'pages/show'

  # devise_for :users, controllers: {
  #   confirmations: 'users/confirmations',
  #   passwords:     'users/passwords',
  #   registrations: 'users/registrations',
  #   sessions:      'users/sessions',
  # }
  
  devise_scope :user do
    delete 'sign_out' => 'devise/sessions#destroy'
    get "sign_in", to: "devise/sessions#new"
  end

end
