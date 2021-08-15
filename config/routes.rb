Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api/docs'
  mount Rswag::Api::Engine => '/api/docs'
  root "home#show"

  namespace :auth do
    post "login", to:"sessions#login"
    post "register", to:"registers#create"
    get "me", to:"profiles#show"
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
      resources :roles
      resources :categories
      resources :news
      resources :commentaries, only: [:create, :index]
      resources :users
      resources :commentaries
      resources :contacts
      resource :organization, only: [:show]
    end
  end
end
