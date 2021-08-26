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
      resources :members, only: [:index]
      resources :posts, only: [:show]
      resources :activities, only: [:show]
      resources :users
      resources :commentaries, only: [:show]
      resources :contacts
      resource :organization, only: [:show]
      resources :posts do
        scope module: :posts_controllers do
          resources :commentaries, only: [:index]
        end
      end
      resources :slides, only: [:index]
    end
  end

  namespace :admin do
    resources :testimonials, only: [:create, :update, :destroy]
    resource :organization, only: [:update]
    resources :slides, only: [:index, :create, :update, :destroy, :show]
    resources :users, only: [:index]
    resources :posts, only: [:create, :destroy, :show, :update]
    resources :activities, only: [:update,:create]
    resources :members, only: [:show, :update, :destroy, :create]
    resources :commentaries, only: [:index]
  end
end