Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :profile, only: [ :show, :edit ]
  get "p/:id", to: "profile#show"
  post "follow/:id",   to: "profile#follow",  as: "follow_user"
  delete "unfollow/:id", to: "profile#unfollow", as: "unfollow_user"
end
