Rails.application.routes.draw do
  root "home#show"
  namespace :api do
    namespace :v1 do
      resources :organizations
      put 'organizations/:id/restore', to: 'organizations#restore'
      patch 'organizations/:id/restore', to: 'organizations#restore'
      resources :roles
      resources :categories
    end
  end
end
