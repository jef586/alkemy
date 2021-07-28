Rails.application.routes.draw do
  root "home#show"
  namespace :api do
    namespace :v1 do
      resources :roles
      resources :categories
    end
  end
end
