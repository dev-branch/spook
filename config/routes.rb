Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :cities

  resources :ships do
    resources :cabins
  end

  resources :cruises do
    member do
      patch '/add_date', to: 'cruises#add_date'
      patch '/add_city', to: 'cruises#add_city'
    end
  end

  resources :reservations do
    collection do
      post '/select_cruise', to: 'reservations#select_cruise'
    end
  end
end
