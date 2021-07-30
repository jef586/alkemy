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
    end
  end
end
