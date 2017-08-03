class PostsController < ApplicationController
  before_action :authenticate

  def index
    @posts = Post.all
  end

  def show
    @post = find_post
  end

  def new
    @post = Post.new
  end

  def edit
    @post = find_post
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @post = find_post

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }

        format.json { render json: @post.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @post = find_post
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
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
