class CommentsController < ApplicationController
  helper_method :post

  def index
    @comments = post.comments
  end

  # GET /posts/:post_id/comments/new
  def new
    @comment = post.comments.new
  end

  # POST /posts/:post_id/comments
  def create
    @comment = post.comments.create(comment_params)

    if @comment.valid?
      redirect_to post, notice: 'The comment was successfully created'
    else
      render :new
    end
  end

  private

  def post
    @post ||= Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text) # New protected hash.
  end
end
