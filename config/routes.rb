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
      resources :members
      resources :posts, only: [:show]
      resources :activities
      resources :users
      resources :commentaries
      resources :contacts
      resource :organization, only: [:show]
      resources :posts do
        scope module: :posts_controllers do
          resources :commentaries, only: [:index]
        end
      end
    end
  end

  namespace :admin do
    resources :testimonials, only: [:update, :destroy]
    resource :organization, only: [:update]
    resources :posts, only: [:create, :destroy, :show]
    resources :members, only: [:show, :destroy]
  end
end