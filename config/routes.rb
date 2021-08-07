Rails.application.routes.draw do
  root "home#show"

  namespace :auth do
    post "login", to:"sessions#login"
    post "register", to:"registers#create"
  end
  
  namespace :api do
    namespace :admin do
      resources :members
      resources :testimonials
      resources :contacts
      resources :activities
      resources :slides
    end
    
    namespace :v1 do
      resources :organizations
      resources :roles
      resources :categories
      resources :news
      resources :commentaries, only: [:create, :index]
      resources :users
    end
  end
end
