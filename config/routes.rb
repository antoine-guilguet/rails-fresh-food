Rails.application.routes.draw do

  root to:"pages#homepage"

  resources :products
end
