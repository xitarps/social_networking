Rails.application.routes.draw do
  devise_for :users
  # devise_for :admins, skip: [:registrations], controllers: {sessions: 'admins/sessions'}
  devise_for :admins, skip: [:registrations], controllers: { sessions: 'admin/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'user/timeline#index'

  namespace :admin do
    root to: "home#index"
    resources :admins
  end

  namespace :user do
    resources :users
  end

end
