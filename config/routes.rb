Rails.application.routes.draw do
  root "home#show"

  namespace :auth do
    post "login", to:"sessions#login"
    post "register", to:"registers#create"
  end
  
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

  get '/auth/me' => 'profiles#show'
end
