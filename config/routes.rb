Rails.application.routes.draw do

  root to:"pages#landing_page"

  get 'homepage', to:"pages#homepage"


  resources :products, only: [:index, :show]

  resources :producers

  # Landing Page
  get 'welcome', to:"pages#landing_page"
  get "download_charte", to:"pages#download_charte"
  post 'save_sourcing', to:"pages#save_sourcing"
end
