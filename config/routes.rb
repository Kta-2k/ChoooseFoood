Rails.application.routes.draw do
  root 'foods#index'

  resources :foods, only: %i[index show]

  # devise用
  devise_for :users

  devise_scope :user do
    delete 'sign_out' => 'devise/sessions#destroy'
    get "sign_in", to: "devise/sessions#new"
  end
end
