Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show, :create, :update, :destroy] do
        get '/find', to: 'merchant_finders#show'
      end
    end
  end
end
