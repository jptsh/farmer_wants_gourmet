Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :boxes do
    resources :orders, except: [ :edit, :update ]
  end

  #resources :boxes, only: [ :destroy ]
  resources :orders

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
