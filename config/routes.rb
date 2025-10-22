Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :users, only: [ :show, :edit ]
  # get "u/:id", to: "users#show"
  # post 'users/follow', to 'users#follow'
  # delete 'users/unfollow', to 'users#unfollow'
  # resources :relationships, only: [ :create, :destroy ]
  post "follow/:id",   to: "connection#create",  as: "follow_user"
delete "unfollow/:id", to: "connection#destroy", as: "unfollow_user"
end
