Rails.application.routes.draw do
  root to: 'authentications#new'

  namespace :api, defaults: { format: :json } do
    resource :authentication, only: %i(create)
    resources :users, only: %i(create)
    resources :posts, only: %i(index create show) do
      resources :comments, only: :create
    end
  end

  resource :authentication, only: %i(new create)
  resources :users, only: %i(new create)
  resources :posts do
    resources :comments
  end
end
