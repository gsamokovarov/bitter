class Api::PostsController < Api::ApplicationController
  def show
    respond_with post
  end

  private

  def post
    @post ||= Post.find(params[:id])
  end
end
