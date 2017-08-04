Rails.application.routes.draw do
  root to: 'authentications#new'

  namespace :api, defaults: { format: :json } do
    resources :posts, only: :show
  end

  resource :authentication, only: %i(new create)
  resources :users, only: %i(new create)
  resources :posts do
    resources :comments
  end
end
