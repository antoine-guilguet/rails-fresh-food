Rails.application.routes.draw do

  namespace :admin do
    resources :users
    resources :producers
    resources :products
    resources :categories
    resources :subcategories
    resources :sourcings
    root to: "users#index"
  end

  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }

  root to:"pages#homepage"

  resources :products, only: [:index, :show]

  resources :producers, except: [:edit, :update, :destroy]

  # Onboarding
  get 'onboarding_step_1', to: "producers#select_producer", as: "select_producer"
  get 'onboarding_step_2', to: "producers#upload_producer", as: "upload_producer"
  post 'add_producer', to: "producers#add_producer_to_favorites", as: "add_producer_to_favorites"

  # Homepage
  get 'homepage', to:"pages#homepage"

  # Landing Page
  get 'welcome', to:"pages#landing_page"
  get "download_charte", to:"pages#download_charte"
  post 'save_sourcing', to:"pages#save_sourcing"
end
