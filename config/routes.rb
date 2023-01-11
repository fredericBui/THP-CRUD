Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/contact" , to: "contact#index"
  get "/welcome" , to: "welcome#index"
  get "/profil" , to: "profil#index"
  get :team, to: "team#index"
  # Defines the root path route ("/")
  root "home#index"
end
