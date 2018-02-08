Rails.application.routes.draw do

  root to:"pages#homepage"

  post 'save_sourcing', to:"pages#save_sourcing"

  resources :products
end
