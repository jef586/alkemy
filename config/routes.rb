Rails.application.routes.draw do
  root "home#show"

  namespace :auth do
    post "login", to:"sessions#login"
    post "register", to:"registers#create"
  end
  get "/auth/me", to:"profiles#show"
  
  namespace :api do
    namespace :v1 do
      resources :organizations
      resources :roles
      resources :categories
      resources :testimonials
      resources :members
      resources :news
      resources :activities
      resources :users
    end
  end
 
end
