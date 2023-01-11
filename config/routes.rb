Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/contact" , to: "contact#index"
  get "/welcome" , to: "welcome#index"
  get :team, to: "team#index"

  resources :profil
  resources :gossip
  resources :city

  # Defines the root path route ("/")
  root "gossip#index"
end
