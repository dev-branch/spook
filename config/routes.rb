Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :cities
  resources :ships
  resources :cruises
end
