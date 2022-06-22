Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "app#home"

  resources :users do 
    resources :bookings do
      put 'confirm'
      put 'cancel'
    end
  end

  resources :categories
  resources :events
  resources :roles
  resources :bookings
  resources :cities
  resources :locations
  resources :notifications

  get "/bookings/show", to: "bookings#show", as: "bookings_show"
end
