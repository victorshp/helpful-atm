Rails.application.routes.draw do

  devise_for :users
  root to: 'api/v1/withdrawals#index', defaults: {:format=>:json}

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :withdrawals, only: [ :index, :show, :create ]
    end
  end
end
