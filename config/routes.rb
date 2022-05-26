Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :users, only: [:create, :update]
      resources :workouts, only: [:index, :create]
      resources :routines, only: [:index, :create, :update, :destroy]
      resources :exercises, only: [:index, :create, :update, :destroy]
    end
  end
end
