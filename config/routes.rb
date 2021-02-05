Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :users, only: [] do
        collection do
          get :me
        end
      end

      resources :exercises, only: [:index, :create, :update, :destroy]
    end
  end
end
