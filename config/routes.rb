Rails.application.routes.draw do
  root "home#show"

  namespace :api do
    namespace :v1 do
      resources :organizations
      resources :roles
      resources :categories
      resources :testimonials
      resources :members
      resources :news
      resources :activities
      resources :sessions
      post "/auth/login", to:"session#login"
      resources :registers
      post "/auth/register", to:"register#create"
    end
  end
end
