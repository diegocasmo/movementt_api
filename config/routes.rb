Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :users, only: [:update] do
        collection do
          get :me
        end
      end

      resources :routines, only: [:index, :create, :update, :destroy]
      resources :exercises, only: [:index, :create, :update, :destroy]
    end
  end
end
