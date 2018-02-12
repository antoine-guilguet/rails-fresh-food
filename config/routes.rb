Rails.application.routes.draw do

  root to:"pages#landing_page"

  get 'homepage', to:"pages#homepage"
  get 'welcome', to:"pages#landing_page"

  post 'save_sourcing', to:"pages#save_sourcing"

  resources :products
end
