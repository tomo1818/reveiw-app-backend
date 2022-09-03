Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :groups
      resources :categories do
        get 'get_category'
      end
      resources :reviews do
        get 'get_review'
      end

      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      namespace :auth do
        resources :sessions, only: %i[index]
      end
    end
  end
end
