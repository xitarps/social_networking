Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  devise_for :admins, skip: [:registrations], controllers: { sessions: 'admin/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'user/timeline#index'

  namespace :admin do
    root to: "home#index"
    resources :admins
    resources :users, only: %i[index]
    resources :posts, only: [:index, :show]
  end

  namespace :user do
    resources :users, only: :show
    
    get 'profile', to: "profile#show"

    get 'potential_to_follow', to: "profile#potential_to_follow"
    get 'following', to: "profile#following"
    get 'followers', to: "profile#followers"

    post 'follow/:id', to: "subscriptions#follow", as: :follow
    post 'unfollow/:id', to: "subscriptions#unfollow", as: :unfollow

    resources :posts, only: [:create, :destroy] do
      member do
        post :like_toggle
      end
    end

    resources :comments, only: [:create, :destroy]
  end
end
