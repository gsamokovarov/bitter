Rails.application.routes.draw do
  root to: 'authentications#new'

  namespace :api, defaults: { format: :json } do
    resource :authentication, only: %i(create)
    resources :users, only: %i(create)
    resources :posts, only: :show
  end

  resource :authentication, only: %i(new create)
  resources :users, only: %i(new create)
  resources :posts do
    resources :comments
  end
end
