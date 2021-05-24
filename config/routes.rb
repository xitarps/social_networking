Rails.application.routes.draw do
  # devise_for :admins, skip: [:registrations], controllers: {sessions: 'admins/sessions'}
  devise_for :admins, skip: [:registrations], controllers: { sessions: 'admin/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: "home#index"
  end
end
