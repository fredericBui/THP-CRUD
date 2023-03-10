Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/contact" , to: "contact#index"
  get "/welcome" , to: "welcome#index"
  get :team, to: "team#index"

  resources :profil
  resources :city
  resources :gossips do
    resources :comments
  end

  # Defines the root path route ("/")
  root "gossips#index"
end
