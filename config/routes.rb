Rails.application.routes.draw do
  resources :posts
  root "home#index"
  devise_for :users, controllers: { registrations:
                    "users/registrations" }
  resources :profile, only: [ :show, :edit ]
  get "profile/:id", to: "profile#show"
  post "profile/follow", to: "profile#follow"
  delete "profile/unfollow", to: "profile#unfollow"
  patch "profile/accept/:id", to: "profile#accept", as: :profile_accept
  patch "profile/accept_userpage/:id", to: "profile#accept_userpage", as: :profile_accept_userpage
  delete "profile/delete/:id", to: "profile#delete", as: :profile_delete
  delete "profile/delete_userpage/:id", to: "profile#delete_userpage", as: :profile_delete_userpage
end
