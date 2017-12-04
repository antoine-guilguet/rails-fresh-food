Rails.application.routes.draw do

  root to:"pages#homepage"

  get 'project', to:"pages#project"
  get 'team', to:"pages#team"

  resources :products
end
