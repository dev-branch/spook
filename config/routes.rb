Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :cruises
  resources :cities
  resources :ships do
    resources :cabins
  end
end
