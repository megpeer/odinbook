Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  resources :posts do
    resources :likes
  end
  root "home#index"

  get "/feed", to: "home#feed", as: "feed"

  devise_for :users, controllers: {
                    registrations: "users/registrations",
                    omniauth_callbacks: "users/omniauth_callbacks"
                    }
  # devise_scope :user do
  # delete "sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  # end
  resources :profile, only: [ :show, :edit ]

  get "/profile", to: "profile#index", as: :profile_index
  get "profile/:id", to: "profile#show"
  post "profile/follow", to: "profile#follow"
  delete "profile/unfollow", to: "profile#unfollow"
  patch "profile/accept/:id", to: "profile#accept", as: :profile_accept
  patch "profile/accept_userpage/:id", to: "profile#accept_userpage", as: :profile_accept_userpage
  delete "profile/delete/:id", to: "profile#delete", as: :profile_delete
  delete "profile/delete_userpage/:id", to: "profile#delete_userpage", as: :profile_delete_userpage
end
