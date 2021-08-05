Rails.application.routes.draw do
  root "home#show"
  resources :sessions
  post "/auth/login", to:"sessions#login"
  resources :registers
  post "/auth/register", to:"registers#create"
  
  namespace :api do
    namespace :v1 do
      resources :organizations
      resources :roles
      resources :categories
      resources :testimonials
      resources :members
      resources :news
      resources :activities
      
    end
  end
  
end
