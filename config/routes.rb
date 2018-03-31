Rails.application.routes.draw do
  root to: redirect('/admin')
  devise_for :admins
  # Admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :vsbgs, only: [:index] do
        collection do
          get :data
        end
      end
      resources :vbbas, only: [:index] do
        collection do
          get :data
        end
      end
      resources :bags, only: [:index] do
        collection do
          get :data
        end
      end
    end
  end
end
