Rails.application.routes.draw do
  root to: 'authentications#new'

  resource :authentication, only: %i(new create)
  resources :users, only: %i(new create)
  resources :posts do
    resources :comments
  end
end
