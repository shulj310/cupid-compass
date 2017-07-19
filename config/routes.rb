Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "static_pages#index"

  resources :locations, only: [:index, :new, :create], to: 'static_pages#index'


  namespace :api do
    namespace :v1 do
      resources :locations, only: [:index, :create] do
        resources :reviews, only: [:index]
      end
    end
  end
end
