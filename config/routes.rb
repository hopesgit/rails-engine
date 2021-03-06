Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get 'merchants/find', to: 'merchant_finders#show'
      resources :merchants, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
