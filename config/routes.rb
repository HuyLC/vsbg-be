Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :vsbgs, only: [] do
        collection do
          get :data
        end
      end
      resources :vbbas, only: [] do
        collection do
          get :data
        end
      end
      resources :bags, only: [] do
        collection do
          get :data
        end
      end
    end
  end
end
