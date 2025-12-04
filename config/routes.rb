Rails.application.routes.draw do
  root "home#index"
  devise_for :users
  resources :profile, only: [ :show, :edit ]
  get "p/:id", to: "profile#show"
  post "profile/follow", to: "profile#follow"
  delete "profile/unfollow", to: "profile#unfollow"
  patch "profile/accept/:id", to: "profile#accept", as: :profile_accept
  delete "profile/delete/:id", to: "profile#delete", as: :profile_delete
end
