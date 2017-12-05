Rails.application.routes.draw do

  root to:"pages#homepage"

  post 'save_address', to:"pages#save_address"

  resources :products
end
