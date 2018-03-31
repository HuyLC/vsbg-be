Rails.application.routes.draw do
  root to: redirect('/admin')
  devise_for :admins
  namespace :admin do
    resources :datas, only: [:new] do
      collection do
        get :vsbgs
        get :bags
        get :vbbas
      end
    end
  end
  # Admin
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :vsbgs, only: [:index] do
      end
      resources :vbbas, only: [:index] do
      end
      resources :bags, only: [:index] do
      end
    end
  end
end
