Rails.application.routes.draw do
  root "home#show"

   namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :categories, only: [ :index, :show, :update, :create, :destroy]
    end
  end
end
