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
      resources :posts, only: [:show]
      resources :activities, only: [:show]
      resources :users
      resources :commentaries
      resources :contacts
      resource :organization, only: [:show]
    end
  end

  namespace :admin do
    resource :organization, only: [:update]
    resources :posts, only: [:create, :destroy, :show, :update]
    resources :activities, only: [:create, :destroy, :show, :update]
  end
end