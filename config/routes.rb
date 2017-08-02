Rails.application.routes.draw do
  # GET /
  root to: 'posts#index'

  # GET /posts          #=> PostsController#index
  # GET /posts/:id      #=> PostsController#show
  # GET /posts/new      #=> PostsController#new
  # POST /posts         #=> PostsController#create
  # GET /posts/:id/edit #=> PostsController#edit
  # PUT /posts/:id      #=> PostsController#update
  # PATCH /posts/:id    #=> PostsController#update
  # DELETE /posts/:id   #=> PostsController#destroy
  resources :posts do
    resources :comments
  end
end
