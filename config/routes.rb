Rails.application.routes.draw do

  devise_for :users

  root to:"pages#landing_page"

  resources :products, only: [:index, :show]

  resources :producers

  # Homepage
  get 'homepage', to:"pages#homepage"

  # Landing Page
  get 'welcome', to:"pages#landing_page"
  get "download_charte", to:"pages#download_charte"
  post 'save_sourcing', to:"pages#save_sourcing"
end
