Rails.application.routes.draw do
  root "home#show"
  namespace :api do
    namespace :v1 do
      resources :roles
      resources :categories
      resources :members
      put 'members/:id/restore', to: 'members#restore'
      patch 'members/:id/restore', to: 'members#restore'      
    end
  end
end
