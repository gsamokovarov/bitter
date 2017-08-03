class CommentsController < ApplicationController
  before_action :authenticate

  def index
    @comments = post.comments
  end

  def new
    @comment = post.comments.new
  end

  def create
    @comment = post.comments.create(comment_params)

    if @comment.valid?
      redirect_to post, notice: 'The comment was successfully created'
    else
      render :new
    end
  end

  private

  helper_method def post
    @post ||= Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text) # New protected hash.
  end
end
