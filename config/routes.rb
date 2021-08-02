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
      resources :users
      post "/auth/login", to:"session#login"
    end
  end
end
