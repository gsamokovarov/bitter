class PostsController < ApplicationController
  before_action :authenticate

  def index
    @posts = current_user.posts

    respond_with :@posts
  end

  def show
    @post = find_post

    respond_with :@post
  end

  def new
    @post = Post.new

    respond_with :@post
  end

  def edit
    @post = find_post

    respond_with :@post
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save

    respond_with :@post
  end

  def update
    @post = find_post
    @post.update(post_params)

    respond_with :@post
  end

  def destroy
    @post = find_post
    @post.destroy

    respond_with :@post
  end

  private

  def find_post
    Post.find(params[:id]) # GET /posts/1
  end

  # Never trust parameters from the scary internet, only allow the white
  # list through.
  def post_params
    params.require(:post).permit(:title, :description)
  end
end
