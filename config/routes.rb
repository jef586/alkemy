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
    namespace :v1 do
      resources :roles
      resources :categories
      resources :testimonials
      resources :members
      resources :posts
      resources :activities
      resources :users
      resources :commentaries
      resources :contacts
      resource :organization, only: [:show]
    end
  end

  namespace :admin do
    resource :organization, only: [:update]
  end
end