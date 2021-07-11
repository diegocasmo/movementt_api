Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :users, only: [:update] do
        collection do
          get :me
          put :verify
        end
      end

      resources :workouts, only: [:index, :create]
      resources :routines, only: [:index, :create, :update, :destroy]
      resources :exercises, only: [:index, :create, :update, :destroy]
    end
  end
end
