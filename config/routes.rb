Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/contact" , to: "contact#index"
  get "/welcome" , to: "welcome#index"
  get :team, to: "team#index"

  resources :profil
  resources :gossips
  resources :city
  post "/gossips/:id/new" , to: "comments#create"
  resources :comments
  get "gossips/comments/:id/edit", to: "comments#edit"

  # Defines the root path route ("/")
  root "gossips#index"
end
