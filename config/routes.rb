Rails.application.routes.draw do
  root "home#show"

    namespace :api do
    namespace :v1 do
      resources :news, only: [ :index, :show, :update, :create, :destroy]
    end
  end
end
