class Api::CommentsController < Api::ApplicationController
  before_action :authenticate

  def create
    comment = Comments::Create.new(post, comment_params).call

    respond_with comment, location: nil
  end

  private

  def post
    Post.find(params[:post_id])
  end

  def comment_params
    params.permit(:text)
  end
end
