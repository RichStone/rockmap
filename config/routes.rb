Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  authenticated :user do
    root :to => 'roadmaps#show', :as => "authenticated_root"
  end
  root 'roadmaps#home'
  resources :roadmaps
  get '/consent_given/:consent_id', to: 'buddy_consents#consent_given', as: 'consent_given'
end
