Rails.application.routes.draw do
  root "api/v1/characters#index"
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  
  namespace :api do
    namespace :v1 do
      resources :users, only: :create
      
      namespace :characters do
        resources :search, only: :index
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
