Rails.application.routes.draw do
  root   'users#show'
  resources :users
  resources :events, only: [:show, :new, :create]
end
