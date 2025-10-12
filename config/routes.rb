Rails.application.routes.draw do
  get "home/index"
  devise_for :users
  resources :users, only: [ :show, :edit ]
  root "home#index"
end
