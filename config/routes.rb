Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :cruises do
    member do
      patch '/add_date', to: 'cruises#add_date'
      patch '/add_city', to: 'cruises#add_city'
    end
  end
  resources :cities
  resources :ships do
    resources :cabins
  end
end
