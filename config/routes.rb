Rails.application.routes.draw do
  # posts
  resources :posts do
    resources :comments
    resources :likes
  end

  # profiles

  resources :profiles do
    member do
      get :friends
      post :follow
      delete :unfollow
      patch :accept
      patch :accept_userpage
      delete :delete
      delete :delete_userpage
    end
  end

  # home
  root "home#index"
  get "/feed", to: "home#feed", as: "feed"

  # devise
  devise_for :users, controllers: {
                    registrations: "users/registrations",
                    omniauth_callbacks: "users/omniauth_callbacks"
                    }

  # resources :profile, only: [ :show, :edit ]

  # get "/profile", to: "profile#index", as: :profile_index
  # get "profile/:id", to: "profile#show"
  # post "profile/follow", to: "profile#follow"
  # delete "profile/unfollow", to: "profile#unfollow"
  # patch "profile/accept/:id", to: "profile#accept", as: :profile_accept
  # patch "profile/accept_userpage/:id", to: "profile#accept_userpage", as: :profile_accept_userpage
  # delete "profile/delete/:id", to: "profile#delete", as: :profile_delete
  # delete "profile/delete_userpage/:id", to: "profile#delete_userpage", as: :profile_delete_userpage
end
