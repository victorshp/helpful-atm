Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :withdrawals, only: [ :new, :create ]
    end
  end
end
